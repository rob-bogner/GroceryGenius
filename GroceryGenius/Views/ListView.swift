//
//  ListView.swift
//  Grocery Genius
//
//  Created by Robert Bogner on 27.11.23.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var addNewItem: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    shoppingListProgressView
                    Spacer()
                    listView
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    addButton
                }
            }
            .navigationTitle("Edeka") // Titel für die Navigationsleiste
            .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .leading)), removal: .opacity.combined(with: .move(edge: .trailing))))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var shoppingListProgressView: some View {
        VStack(alignment: .leading) {
            Text("Shopping progress")
                .font(.caption2)
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
            HStack {
                Group {
                    Image(systemName: "basket")
                    ProgressView(value: listViewModel.progressFaction)
                    Text("\(listViewModel.checkedItemCount)/\(listViewModel.totalItemCount)")
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity)
            .background(Color.theme.card)
            .cornerRadius(10)
            .padding(.horizontal, 20)
        }
    }
    
    private var listView: some View {
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
    
    private var addButton: some View {
        HStack {
            Spacer()
            Button(action: {
                addNewItem.toggle()
                print("pressed")
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 45))
                    .foregroundStyle(
                        Color.theme.buttonIconColor,
                        Color.theme.buttonFillColor
                    )
                    .shadow(color: Color.theme.shadow, radius: 10)
            })
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            .sheet(isPresented: $addNewItem, content: {
                AddItemView()
                    .presentationDetents([.height(160)])
                    .presentationCornerRadius(15)
            })
        }
    }
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}
