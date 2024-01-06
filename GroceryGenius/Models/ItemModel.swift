//
//  ItemModel.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 27.11.23.
//

import Foundation

struct ItemModel: Hashable, Identifiable {
    let id: String
    let image: String?
    let name: String
    let units: Int?
    let measure: String?
    let price: Double?
    let isChecked: Bool
    //    let aisle: String?
    
    init(id: String = UUID().uuidString, image: String?, name: String, units: Int?, measure: String?, price: Double?, isChecked: Bool) {
        self.id = id
        self.image = image
        self.name = name
        self.units = units
        self.measure = measure
        self.price = price
        self.isChecked = isChecked
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, image: image, name: name, units: units, measure: measure, price: price, isChecked: !isChecked)
    }
}
