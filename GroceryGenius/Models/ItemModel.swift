/*
GroceryGenius
ItemModel.swift
Created by Robert Bogner on 27.11.23.

Defines the data structure for items in the Grocery Genius app.
*/

import Foundation

/// Represents an individual item in the grocery list.
/// Conforms to `Hashable` for list diffing and `Identifiable` for unique identification.
struct ItemModel: Hashable, Identifiable {
    // Unique identifier for the item, defaulting to a UUID string.
    let id: String

    // Optional property for an image reference, e.g., a filename or URL string.
    private(set) var image: String?

    // The name of the item, e.g., "Milk".
    private(set) var  name: String

    // Optional property representing the number of units for the item, e.g., 3.
    private(set) var  units: Int?

    // Optional property for the measurement unit, e.g., "Liters".
    private(set) var  measure: String?

    // Optional property representing the price of the item.
    private(set) var  price: Double?

    // Boolean flag indicating whether the item has been checked off in the list.
    let isChecked: Bool
    
    // Uncomment and use `aisle` if you want to include the aisle information of the item.
    // let aisle: String?
    
    /// Initializes a new item with provided details.
    /// If `id` is not provided, it defaults to a new UUID string.
    init(id: String = UUID().uuidString, image: String?, name: String, units: Int?, measure: String?, price: Double?, isChecked: Bool) {
        self.id = id
        self.image = image
        self.name = name
        self.units = units
        self.measure = measure
        self.price = price
        self.isChecked = isChecked
    }
    
    /// Toggles the `isChecked` state of the item.
    /// - Returns: A new `ItemModel` instance with the `isChecked` state inverted.
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, image: image, name: name, units: units, measure: measure, price: price, isChecked: !isChecked)
    }
    
    mutating func updateItem(newImage: String?, newName: String, newUnits: Int?, newMeasure: String?, newPrice: Double?, newIsChecked: Bool) -> ItemModel {
        return ItemModel(image: newImage, name: newName, units: newUnits, measure: newMeasure, price: newPrice, isChecked: newIsChecked)
    }
}
