//
//  ShieldManager.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/15/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI
import FamilyControls
import ManagedSettings

class ShieldManager: ObservableObject {
    @Published var discouragedSelection = FamilyActivitySelection()
    
    private var store = ManagedSettingsStore()
    
    func shieldActivities() {
        store.clearAllSettings()
        
        let applications = discouragedSelection.applicationTokens
        let categories = discouragedSelection.categoryTokens
        
        store.shield.applications = applications.isEmpty ? nil : applications
        store.shield.applicationCategories = categories.isEmpty ? nil : .specific(categories)
        store.shield.webDomainCategories = categories.isEmpty ? nil : .specific(categories)
        
    }
}
