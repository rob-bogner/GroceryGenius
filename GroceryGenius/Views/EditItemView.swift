/*
GroceryGenius
AddItemView.swift
Created by Robert Bogner on 13.01.24.

Provides an interface for editing an existing items in the grocery list.
*/

import SwiftUI

struct EditItemView: View {
    
    @Environment(\.dismiss) private var dismiss // Environment property to dismiss the view.
    @EnvironmentObject var listViewModel: ListViewModel // Environment object for accessing the ListViewModel.
    var item: ItemModel // The item being edited.
    @State private var editName: String // State for the edited name of the item.
    @State private var editUnits: String // State for the edited unit count of the item.
    @State private var editMeasure: String // State for the edited measurement unit of the item.
    @State private var editPrice: String // State for the edited price of the item.

    
    init(item: ItemModel) {
        self.item = item
        // Initializing states with the current values of the item properties.
        _editName = State(initialValue: item.name)
        _editUnits = State(initialValue: String(item.units))
        _editMeasure = State(initialValue: item.measure)
        _editPrice = State(initialValue: String(item.price))
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            closeButton // Close button at the top.
            editItemTitle // Title of the edit item view.
            editItemName // TextField for editing the name.
            editItemUnits // TextField for editing the units.
            editItemMeasure // TextField for editing the measurement unit.
            editItemPrice // TextField for editing the price.
            saveButton // Save button to store the changes.
            Spacer()
        }
    }
    
    /// Button for closing the EditItemView.
    private var closeButton: some View {
        Button(action: {
            dismiss() // Dismisses the view when pressed.
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .tint(.gray)
        })
        .frame(alignment: .trailing)
        .padding(.top)
        .padding(.trailing)
    }
    
    private var editItemTitle: some View {
        Text("Edit Item")
            .padding(.horizontal)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var editItemName: some View {
        TextField("Enter item name here, e.g. Milk", text: $editName)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemUnits: some View {
        TextField("Enter units here, e.g. 2", text: $editUnits)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemMeasure: some View {
        TextField("Enter measure here, e.g. Liters", text: $editMeasure)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemPrice: some View {
        TextField("Enter price here, e.g. 1.99", text: $editPrice)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    /// Button for saving the edited item to the list.
    private var saveButton: some View {
        Button(action: {
            saveItemPressed() // Calls the function to save the edited item.
            dismiss() // Dismisses the view after saving the item.
        }, label: {
            Text("Save")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(.white)
                .font(.headline)
        })
        .padding()
    }
    
    /// Function called when the save button is pressed.
    /// Creates an updated item model with edited properties and saves it to the list using the ViewModel.
    func saveItemPressed() {
        let updatedItem = ItemModel(
                id: item.id, // Use the existing ID to identify the same item
                image: item.image, // Optionally, you can add an editImage if you handle image editing in your UI
                name: editName,
                units: Int(editUnits), // Convert units from String to Int
                measure: editMeasure,
                price: Double(editPrice), // Convert price from String to Double
                isChecked: item.isChecked
            )
        listViewModel.saveItem(updatedItem: updatedItem) // Updating the item in the list model
    }
}

#Preview {
    EditItemView(item: MockData.sampleItem)
                .environmentObject(ListViewModel())
}
