//
//  GroceryGeniusApp.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 27.11.23.
//

import SwiftUI

@main
struct GroceryGeniusApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
