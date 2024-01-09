/*
GroceryGenius
MockData.swift
Created by Robert Bogner on 27.11.23.

Provides mock data for the Grocery Genius app, useful for development and testing purposes.
*/

import Foundation

/// Struct to hold mock data for the application.
struct MockData {
    
    /// A sample item used for previews or testing.
    static let sampleItem: ItemModel = ItemModel(
        image: "Milch",
        name: "Milch",
        units: 3,
        measure: "Pkg.",
        price: 1.59, isChecked: false
    )
    
    /// An array of `ItemModel` representing a list of items.
    /// This mock data can be used for development and testing, providing a way to work with sample data.
    static var items = [
        ItemModel(
            image: "Milch",
            name: "Milch",
            units: 3,
            measure: "Pkg.",
            price: 1.59, isChecked: false
        ),
        ItemModel(
            image: "Butter",
            name: "Butter",
            units: 1,
            measure: "Stk.",
            price: 1.79, isChecked: false
        ),
        ItemModel(
            image: "Kaese",
            name: "Käse",
            units: 200,
            measure: "g",
            price: 3.29, isChecked: false
        ),
        ItemModel(
            image: "Spaghetti",
            name: "Spaghetti",
            units: 1,
            measure: "Pkg.",
            price: 1.99, isChecked: false
        ),
        ItemModel(
            image: "PassierteTomaten",
            name: "Passierte Tomaten",
            units: 1,
            measure: "Fl.",
            price: 1.89, isChecked: false
        ),
        ItemModel(
            image: "Chips",
            name: "Chips",
            units: 1,
            measure: "Pkg.",
            price: 2.19, isChecked: false
        ),
        ItemModel(
            image: "Toillettenpapier",
            name: "Toillettenpapier",
            units: 1,
            measure: "Pkg.",
            price: 3.89, isChecked: false
        ),
        ItemModel(
            image: "Cola Zero",
            name: "Cola Zero",
            units: 1,
            measure: "Pkg.",
            price: 3.89, isChecked: false
        ),
        ItemModel(
            image: "Salat",
            name: "Salat",
            units: 1,
            measure: "Stk.",
            price: 1.39, isChecked: false
        ),
        ItemModel(
            image: "Lachs",
            name: "Lachs",
            units: 400,
            measure: "g.",
            price: 13.89, isChecked: false
        )
    ]
}
