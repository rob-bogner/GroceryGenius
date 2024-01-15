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

    // The name of the item, e.g., "Milk". Central to identifying the item in the list.
    private(set) var  name: String

    // Optional property representing the number of units for the item, e.g., 3. Useful for quantity tracking.
    private(set) var  units: Int?

    // Optional property for the measurement unit, e.g., "Liters". Adds more detail to the item description.
    private(set) var  measure: String?

    // Optional property representing the price of the item. Important for budgeting and cost tracking.
    private(set) var  price: Double?

    // Boolean flag indicating whether the item has been checked off in the list. Helps track completion.
    let isChecked: Bool
    
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
        self.image = image
        self.name = name
        self.units = units
        self.measure = measure
        self.price = price
        self.isChecked = isChecked
    }
    
    /// Toggles the `isChecked` state of the item.
    /// Useful for marking an item as completed or not.
    /// - Returns: A new `ItemModel` instance with the `isChecked` state inverted.
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, image: image, name: name, units: units, measure: measure, price: price, isChecked: !isChecked)
    }
    
    /// Updates the item with new provided values.
    /// - Parameters:
    ///   - newImage: The updated image reference.
    ///   - newName: The updated name of the item.
    ///   - newUnits: The updated number of units.
    ///   - newMeasure: The updated measurement unit.
    ///   - newPrice: The updated price.
    ///   - newIsChecked: The updated checked status.
    /// - Returns: A new `ItemModel` instance with updated values.
    mutating func updateItem(newImage: String?, newName: String, newUnits: Int?, newMeasure: String?, newPrice: Double?, newIsChecked: Bool) -> ItemModel {
        // This method creates and returns a new instance of ItemModel with the updated values provided.
        // Useful for editing and saving changes to an existing item.
        return ItemModel(image: newImage, name: newName, units: newUnits, measure: newMeasure, price: newPrice, isChecked: newIsChecked)
    }
}
