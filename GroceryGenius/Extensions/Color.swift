//
//  Color.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 05.01.24.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
}

struct ColorTheme  {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let card = Color("CardColor")
    let shadow = Color("ShadowColor")
    let buttonFillColor = Color("ButtonFillColor")
    let buttonIconColor = Color("ButtonIconColor")
    
}
