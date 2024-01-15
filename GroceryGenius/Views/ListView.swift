/*
GroceryGenius
ListView.swift
Created by Robert Bogner on 08.01.24.

Presents a detailed view of the items list, allowing interaction through swipe actions.
*/

import SwiftUI

/// A view for displaying the list of items, both checked and unchecked.
struct ListView: View {
    
    @ObservedObject var listViewModel: ListViewModel // ViewModel providing the data and logic for the list.
    @State private var showEditItemView: Bool = false // State to control the presentation of the EditItemView.

    var body: some View {
        List {
            uncheckedItemsSection // Section displaying items that are not checked.
            checkedItemsSection // Section displaying items that are checked.
        }
        .listStyle(PlainListStyle()) // Sets the list to a plain style for a more standard look.
        .sheet(isPresented: $showEditItemView) {
            // Presents the EditItemView as a modal sheet when an item is selected for editing.
            if let selectedItem = listViewModel.selectedItem {
                EditItemView(item: selectedItem)
                    .environmentObject(listViewModel) // Passes the ListViewModel to the EditItemView.
            }
        }
    }
    
    /// Section displaying unchecked items.
    /// Iterates through items that are not checked and presents them using `ListRowView`.
    private var uncheckedItemsSection: some View {
        ForEach(listViewModel.items.filter { !$0.isChecked }) { item in
            ListRowView(item: item) // Custom view for displaying a single list item.
                .listRowSeparator(.hidden) // Hides the row separator for a cleaner look.
                .listRowBackground(Color.theme.background) // Sets the background color for the row.
                .swipeActions(allowsFullSwipe: false) {
                    // Swipe actions allow additional functionalities like edit and delete.
                    Button {
                        print("Not available") // Placeholder action. Update as needed.
                    } label: {
                        Label("Not available", systemImage: "minus.circle")
                    }
                    .tint(.orange)
                    Button("Edit", systemImage: "pencil.circle") {
                        listViewModel.selectedItem = item // Sets the selected item for editing.
                        showEditItemView = true // Triggers the presentation of the EditItemView.
                    }
                    .tint(.blue)
                    Button(role: .destructive) {
                        withAnimation {
                            listViewModel.deleteItem(item: item) // Deletes the item from the list.
                        }
                    } label: {
                        Label("Delete", systemImage: "trash.circle")
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        withAnimation {
                            listViewModel.toggleItemChecked(item: item) // Toggles the checked status of the item.
                        }
                    } label: {
                        Label("Check", systemImage: "checkmark.circle")
                    }
                    .tint(.green)
                }
        }
    }
    
    /// Section displaying checked items.
    /// Displays only if there are checked items in the list, to keep track of checked items.
    private var checkedItemsSection: some View {
        Group {
            if listViewModel.checkedItemCount > 0 {
                Section(header: Text("Checked Items")) { // Header for the checked items section.
                    ForEach(listViewModel.items.filter { $0.isChecked }) { item in
                        ListRowView(item: item) // View for each checked list item.
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.theme.background)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button {
                                    withAnimation {
                                        listViewModel.toggleItemChecked(item: item) // Allows unchecking of an item.
                                    }
                                } label: {
                                    Label("Uncheck", systemImage: "arrow.uturn.backward.circle")
                                }
                                .tint(.yellow)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button {
                                    withAnimation {
                                        listViewModel.deleteItem(item: item) // Enables deletion of a checked item.
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash.circle")
                                }
                                .tint(.red)
                            }
                    }
                }
            } else {
                EmptyView() // Shows an empty view when there are no checked items, simplifying the user interface.
            }
        }
    }
}

#Preview {
    ListView(listViewModel: ListViewModel()) // Preview setup with a ListViewModel.
}
