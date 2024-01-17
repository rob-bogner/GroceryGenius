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
    private(set) var image: String

    // The name of the item, e.g., "Milk". Central to identifying the item in the list.
    private(set) var name: String

    // Optional property representing the number of units for the item, e.g., 3. Useful for quantity tracking.
    private(set) var units: Int

    // Optional property for the measurement unit, e.g., "Liters". Adds more detail to the item description.
    private(set) var measure: String

    // Optional property representing the price of the item. Important for budgeting and cost tracking.
    private(set) var price: Double

    // Boolean flag indicating whether the item has been checked off in the list. Helps track completion.
    private(set) var isChecked: Bool
    
    // Uncomment and use `aisle` if you want to include the aisle information of the item.
    // let aisle: String?
    
    /// Initializes a new item with provided details.
    /// Defaults the `id` to a new UUID string if not provided.
    /// - Parameters:
    ///   - id: The unique identifier for the item.
    ///   - image: An optional image reference for the item.
    ///   - name: The name of the item.
    ///   - units: The optional number of units for the item.
    ///   - measure: The optional measurement unit for the item.
    ///   - price: The optional price of the item.
    ///   - isChecked: The boolean flag indicating if the item is checked off.
    init(id: String = UUID().uuidString, image: String?, name: String, units: Int?, measure: String?, price: Double?, isChecked: Bool) {
        self.id = id
        self.image = image ?? ""
        self.name = name
        self.units = units ?? 0
        self.measure = measure ?? ""
        self.price = price ?? 0
        self.isChecked = isChecked
    }
    
    /// Updates the item with new provided values.
    /// Allows selectively updating any of the properties.
    /// - Parameters:
    ///   - newImage: The updated image reference (optional).
    ///   - newName: The updated name of the item (optional).
    ///   - newUnits: The updated number of units (optional).
    ///   - newMeasure: The updated measurement unit (optional).
    ///   - newPrice: The updated price (optional).
    ///   - newIsChecked: The updated checked status (optional).
    mutating func updateItem(newImage: String? = nil, newName: String? = nil, newUnits: Int? = nil, newMeasure: String? = nil, newPrice: Double? = nil, newIsChecked: Bool? = nil) {
            if let newImage = newImage { self.image = newImage }
            if let newName = newName { self.name = newName }
            if let newUnits = newUnits { self.units = newUnits }
            if let newMeasure = newMeasure { self.measure = newMeasure }
            if let newPrice = newPrice { self.price = newPrice }
            if let newIsChecked = newIsChecked { self.isChecked = newIsChecked }
    }
}
