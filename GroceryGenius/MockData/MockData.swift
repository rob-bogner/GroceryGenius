//
//  MockData.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 27.11.23.
//

import Foundation

struct MockData {
    
    static let sampleItem: ItemModel = ItemModel(
        image: "Milch",
        name: "Milch",
        units: 3,
        measure: "Pkg.",
        price: 1.59, isChecked: false
    )
    
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
        )
    ]
}
