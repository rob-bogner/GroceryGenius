/*
GroceryGenius
AddItemView.swift
Created by Robert Bogner on 04.12.23.

Provides an interface for adding new items to the grocery list.
*/

import SwiftUI

/// A view for adding new items to the grocery list.
struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss // Environment property for dismissing the view.
    @EnvironmentObject var listViewModel: ListViewModel // ViewModel for managing the list data.
    @State private var item: String = "" // State for the new item's name.
    @FocusState private var addItemFocus: Bool // Focus state to manage the keyboard focus.
    
    var body: some View {
        VStack(alignment: .trailing) {
            closeButton // Button for closing the view.
            addItemTitle // Title of the view.
            itemTextField // Text field for entering the new item's name.
            addButton // Button for adding the new item to the list.
            Spacer()
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                addItemFocus = true // Automatically focuses the text field when the view appears.
            }
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

    /// Title of the add item view.
    private var addItemTitle: some View {
        Text("Add an item")
            .padding(.horizontal)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    /// Text field for entering the name of the new item.
    private var itemTextField: some View {
        TextField("Enter item name here", text: $item)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.bottom, 8)
            .focused($addItemFocus)
    }

    /// Button for adding the entered item to the list.
    private var addButton: some View {
        Button(action: {
            addItemPressed() // Calls the function to add the item.
            dismiss() // Dismisses the view after adding the item.
        }, label: {
            Text("Add item to list")
                .padding()
                .frame(width: 200)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(.white)
                .font(.headline)
        })
    }
    
    /// Function called when the add button is pressed.
    /// Adds the entered item to the list using the ViewModel.
    func addItemPressed() {
        listViewModel.addItem(name: item)
    }
}

#Preview {
    AddItemView()
        .environmentObject(ListViewModel()) // Preview setup with a ListViewModel.
}
