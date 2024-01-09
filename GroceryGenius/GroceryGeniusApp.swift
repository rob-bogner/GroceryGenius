/*
GroceryGenius
GroceryGeniusApp.swift
Created by Robert Bogner on 27.11.23.

The main entry point of the Grocery Genius app.
Configures the app's initial view and environment.
*/

import SwiftUI

/// The main application struct for Grocery Genius.
/// Conforms to the `App` protocol, defining the app's configuration and initial content.
@main
struct GroceryGeniusApp: App {
    /// Defines the content and behavior of the app's scene.
    var body: some Scene {
        WindowGroup {
            ShoppingListView() // The root view of the app.
                .environmentObject(ListViewModel()) // Provides a ListViewModel instance to the app's environment.
        }
    }
}

// Note: The `@main` attribute identifies `GroceryGeniusApp` as the app's entry point.
// `WindowGroup` creates a new window for the app's UI, and `ShoppingListView` is set as the initial view.
// The `ListViewModel` is injected as an environment object to be accessible throughout the app.
