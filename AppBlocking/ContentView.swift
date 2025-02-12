//
//  App.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import FamilyControls
import SwiftUI
import ManagedSettings


struct ContentView: View {
    @State var isPresented: Bool = false
    @State var model = MyModel()
    
    private let store = ManagedSettingsStore()
    
    var body: some View {
        VStack {
            Button("Select Apps to Block"){
                isPresented = true
            }
            .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
            .onChange(of: model.selectionToDiscourage) { selection in
                let applicationTokens = selection.applications.map(ApplicationToken.init)
                store.shield.applications = Set(applicationTokens)
            }
            
            Button("Unblock Apps"){
                store.shield.applications = nil
            }
        }
        .onAppear {
            Task {
                do {
                    try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                }
                catch {
                    print("Error: failed authorization: \(error)")
                }
            }
        }
    }
}


