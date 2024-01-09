/*
GroceryGenius
ListViewModel.swift
Created by Robert Bogner on 02.01.24.

Manages the data and business logic for the ListView of the Grocery Genius app.
*/

import Foundation // Used for basic data handling and ObservableObject.

/// ViewModel for managing and presenting list data in the ListView.
class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] // Holds an array of ItemModel representing each item in the ListView.
    
    init() {
        getItems() // Initial fetch of items.
    }
    
    /// Calculates the total number of items in the list.
    /// A computed property that returns the count of all items in the list.
    var totalItemCount: Int {
        items.count
    }
    
    /// Counts the number of items in the list that have been marked as checked.
    /// A computed property that applies a filter to the list to include only items with `isChecked` set to true, then returns the total count of these items.
    var checkedItemCount: Int {
        items.filter({ $0.isChecked }).count
    }
    
    /// Calculates the progress fraction of checked items in the list.
    /// Computes the ratio of checked items to total items, returning 0 if there are no items in the list.
    var progressFraction: Double {
        totalItemCount > 0 ? Double(checkedItemCount) / Double(totalItemCount) : 0
    }
    
    /// Fetches items from MockData and append them to the list, to provide sample items in the list.
    func getItems()  {
        items.append(contentsOf: MockData.items)
    }
    
    /// Deletes an item from the list.
    /// - Parameter item: The `ItemModel` to be deleted.
    func deleteItem(item: ItemModel) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items.remove(at: index)
            }
    }
    
    /// Adds a new item to the list with given details.
    /// - Parameters:
    ///   - image: (Optional) The image string reference of the item.
    ///   - name: The name of the item, e.g., "Milk".
    ///   - units: (Optional) The number of units, e.g., 3.
    ///   - measure: (Optional) The measurement unit, e.g., "Litre".
    ///   - price: (Optional) The price of the item, e.g., 1.99.
    func addItem(image: String? = nil, name: String, units: Int? = nil, measure: String? = nil, price: Double? = nil) {
        let newItem = ItemModel(image: image, name: name, units: units, measure: measure, price: price, isChecked: false)
        items.append(newItem)
    }
    
    /// Updates the checked status of an item.
    /// Toggles the `isChecked` property of the item with the given ID.
    func toggleItemChecked(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
