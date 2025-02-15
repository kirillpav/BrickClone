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
import DeviceActivity


struct ContentView: View {
    @State var isPresented: Bool = false
    @State var model = MyModel()
    
    private let store = ManagedSettingsStore()
    
    let center = AuthorizationCenter.shared
    
    var body: some View {
        VStack {
            Button("Select Apps to Block"){
                isPresented = true
            }
            .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
            .onChange(of: model.selectionToDiscourage) { selection in
                let applicationTokens = selection.applicationTokens
                store.shield.applications = Set(applicationTokens)
                
                print("Apps to block: \(applicationTokens)")
            }
            
            Button("Unblock Apps"){
                store.shield.applications = nil
                print("Apps unblocked")
            }
        }
        .onAppear {
            Task {
                do {
                    try await center.requestAuthorization(for: .individual)
                }
                catch {
                    print("Error: failed authorization: \(error)")
                }
            }
        }
    }
}


