//
//  ListView.swift
//  Grocery Genius
//
//  Created by Robert Bogner on 27.11.23.
//

import SwiftUI

struct ShoppingListView: View {
    
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
        ShoppingListProgressView(listViewModel: listViewModel)
    }
    
    private var listView: some View {
        ListView(listViewModel: listViewModel)
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
    ShoppingListView()
        .environmentObject(ListViewModel())
}
