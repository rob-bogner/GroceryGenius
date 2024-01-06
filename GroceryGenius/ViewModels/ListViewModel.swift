//
//  ListViewModel.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 02.01.24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems()  {
        items.append(contentsOf: MockData.items)
    }
    
    func deleteItem(item: ItemModel) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items.remove(at: index)
            }
    }
    
    func addItem(image: String? = nil, name: String, units: Int? = nil, measure: String? = nil, price: Double? = nil) {
        let newItem = ItemModel(image: image, name: name, units: units, measure: measure, price: price, isChecked: false)
        items.append(newItem)
    }
    
    func toggleItemChecked(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
