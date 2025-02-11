//
//  MyModel().swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import FamilyControls
import Combine

class MyModel: ObservableObject {
    @Published var selectionToDiscourage: FamilyActivitySelection = FamilyActivitySelection()
}
