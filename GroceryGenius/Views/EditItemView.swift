//
//  EditItemView.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 13.01.24.
//

import SwiftUI

struct EditItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    var item: ItemModel
    @State private var editName: String
    @State private var editUnits: String
    @State private var editMeasure: String
    @State private var editPrice: String

    
    init(item: ItemModel) {
        self.item = item
        _editName = State(initialValue: item.name)
        _editUnits = State(initialValue: item.units.map { String($0) } ?? "")
        _editMeasure = State(initialValue: item.measure ?? "")
        _editPrice = State(initialValue: item.price.map { String($0) } ?? "")
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            closeButton
            editItemTitle
            editItemName
            editItemUnits
            editItemMeasure
            editItemPrice
            saveButton
            Spacer()
        }
    }
    
    /// Button for closing the add item view.
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
        TextField("Enter item name", text: $editName)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemUnits: some View {
        TextField("Enter item name", text: $editUnits)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemMeasure: some View {
        TextField("Enter item name", text: $editMeasure)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    private var editItemPrice: some View {
        TextField("Enter item name", text: $editPrice)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
    
    /// Button for adding the entered item to the list.
    private var saveButton: some View {
        Button(action: {
            saveItemPressed() // Calls the function to add the item.
            dismiss() // Dismisses the view after adding the item.
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
    /// saves the changes of the item to the list using the ViewModel.
    func saveItemPressed() {
        let updatedItem = ItemModel(
                id: item.id, // Verwenden Sie die bestehende ID, um das gleiche Element zu identifizieren
                image: item.image, // Sie können auch editImage hinzufügen, falls Sie dies in Ihrer UI bearbeiten
                name: editName,
                units: Int(editUnits),
                measure: editMeasure,
                price: Double(editPrice),
                isChecked: item.isChecked
            )
        listViewModel.saveItem(updatedItem: updatedItem)
        print("Saved")
//        listViewModel.addItem(item: item)
    }
}

#Preview {
    EditItemView(item: MockData.sampleItem)
                .environmentObject(ListViewModel())
}
