//
//  ListView.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 08.01.24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            uncheckedItemsSection
            checkedItemsSection
        }
        .listStyle(PlainListStyle())
    }
    
    private var uncheckedItemsSection: some View {
        ForEach(listViewModel.items.filter { !$0.isChecked }) { item in
            ListRowView(item: item)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.theme.background)
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        print("Not available")
                    } label: {
                        Label("Not available", systemImage: "minus.circle")
                    }
                    .tint(.orange)
                    Button(role: .destructive) {
                        withAnimation {
                            listViewModel.deleteItem(item: item)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash.circle")
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        withAnimation {
                            listViewModel.toggleItemChecked(item: item)
                        }
                    } label: {
                        Label("Check", systemImage: "checkmark.circle")
                    }
                    .tint(.green)
                }
        }
    }
    
    private var checkedItemsSection: some View {
        Group {
            if listViewModel.checkedItemCount > 0 {
                Section(header: Text("Checked Items")) {
                    ForEach(listViewModel.items.filter { $0.isChecked } ) { item in
                        ListRowView(item: item)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.theme.background)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button {
                                    withAnimation {
                                        listViewModel.toggleItemChecked(item: item)
                                    }
                                } label: {
                                    Label("Uncheck", systemImage: "arrow.uturn.backward.circle")
                                }
                                .tint(.yellow)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button {
                                    withAnimation {
                                        listViewModel.deleteItem(item: item)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash.circle")
                                }
                                .tint(.red)
                            }
                    }
                }
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    ListView(listViewModel: ListViewModel())
}
