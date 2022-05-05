//
//  ReadaMenuApp.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI
import FirebaseCore

@main
struct ReadaMenuApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}
