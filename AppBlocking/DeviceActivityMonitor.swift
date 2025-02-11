//
//  DeviceActivityMonitor.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//


import Foundation
import DeviceActivity
import ManagedSettings

class MyMonitor: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        
        let model = MyModel()
        
        let applications = model.selectionToDiscourage.applications
        
        store.shield.applications = applications.isEmpty ? nil : applications
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        
        store.shield.applications = nil
    }
}
