/*
GroceryGenius
Color.swift
Created by Robert Bogner on 05.01.24.

Extends the Color struct to include a custom color theme for the Grocery Genius app.
*/

import Foundation
import SwiftUI

/// Extends SwiftUI's Color to include a custom color theme.
extension Color {
    static let theme = ColorTheme() // Provides access to the custom color theme.
}

/// Struct defining a custom color theme for the app.
struct ColorTheme  {
    
    let accent = Color("AccentColor") // Accent color used throughout the app.
    let background = Color("BackgroundColor") // Background color for views.
    let card = Color("CardColor") // Color used for card-like elements.
    let shadow = Color("ShadowColor") // Color used for shadows.
    let buttonFillColor = Color("ButtonFillColor") // Fill color for buttons.
    let buttonIconColor = Color("ButtonIconColor") // Color for icons on buttons.
    
    // Note: The actual color values are expected to be defined in the asset catalog.
    // The string identifiers ("AccentColor", "BackgroundColor", etc.) should correspond
    // to color set names in the asset catalog.
}
