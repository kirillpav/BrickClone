//
//  App.swift
//  NFCTagReader
//
//  Created by Kirill Pavlov on 2/8/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import FamilyControls
import SwiftUI


struct ContentView: View {
    @State var isPresented: Bool = false
    @State var model = MyModel()
    
    var body: some View {
        Button("Select Apps to Block"){
            isPresented = true
        }
        .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
    }
}


