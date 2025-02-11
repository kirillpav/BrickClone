//
//  DeviceActivitySchedule.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import DeviceActivity

@available(iOS 15.0, *)
extension DeviceActivityName {
    static let daily = Self("daily")
}

@available(iOS 15.0, *)
let schedule = DeviceActivitySchedule(
    intervalStart: DateComponents(hour: 0, minute: 0), intervalEnd: DateComponents(hour: 23, minute: 59), repeats: true
    )
@available(iOS 15.0, *)
let center = DeviceActivityCenter()
try center.startMonitoring(.daily, during: schedule)
// I guess we start monetering when the NFC tag is read ? 

