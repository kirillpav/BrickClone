//
//  AppBlocking.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import FamilyControls


AuthorizationCenter.shared.requestAuthorization{ result in
    switch(result) {
    case .success:
        print("Authorization granted")
    case .failure(let error):
        print("Authorization denied: \(error)")
    }
}


