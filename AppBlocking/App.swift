//
//  App.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/10/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI
import FamilyControls

@main
struct NFCTagReaderApp: App {
    
    let center = AuthorizationCenter.shared
    
    var body: some Scene {
        WindowGroup {
            ShieldView()
                .task {
                    do {
                        try await center.requestAuthorization(for: .individual)
                    }
                    catch {
                        print("Authorization Error: \(error)")
                    }
                }
        }
    }
}
