//
//  MuscleApp.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI
import Firebase

@main
struct MuscleApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
