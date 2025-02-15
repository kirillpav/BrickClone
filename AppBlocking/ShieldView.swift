//
//  ShieldView.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/15/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI
import FamilyControls

struct ShieldView: View {
    @StateObject private var manager = ShieldManager()
    @State private var showActivityPicker = false
    
    var body: some View {
        VStack {
            Button {
                showActivityPicker = true
            } label: {
                Label("Configure activities", systemImage: "gearshape")
            }
            .buttonStyle(.borderedProminent)
            Button("Apply Shielding") {
                manager.shieldActivities()
            }
            .buttonStyle(.bordered)
        }
        .familyActivityPicker(isPresented: $showActivityPicker, selection: $manager.discouragedSelection)
    }
}

#Preview {
    ShieldView()
}
