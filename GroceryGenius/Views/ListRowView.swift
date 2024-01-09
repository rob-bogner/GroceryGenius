/*
GroceryGenius
ListRowView.swift
Created by Robert Bogner on 27.11.23.

Defines the appearance and behavior of a single row in the grocery list.
*/

import SwiftUI

/// Represents a single row in the list view, displaying details of an item.
struct ListRowView: View {
    
    let item: ItemModel // The item model that this row represents.

    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea() // Sets the background color of the row.
            HStack(alignment: .top) {
                itemImageView // Displays the image of the item.

                VStack(alignment: .leading) {
                    itemNameView // Displays the name of the item.
                    Spacer()
                    itemDetailsView // Displays additional details of the item.
                }
                .padding(.trailing, 7)
                .padding(.vertical, 7)
            }
            .background(item.isChecked ? Color.theme.buttonFillColor : Color.theme.card) // Changes background based on checked status.
            .opacity(item.isChecked ? 0.5 : 1) // Adjusts opacity for checked items.
            .cornerRadius(10)
        }
    }

    /// View for displaying the image of the item.
    private var itemImageView: some View {
        Group {
            if let imageName = item.image {
                Image(imageName)
                    .resizable()
            } else {
                Image(systemName: "photo")
                    .resizable()
            }
        }
        .scaledToFit()
        .frame(width: 50, height: 50)
        .cornerRadius(5)
        .padding(10)
    }

    /// View for displaying the name of the item, with strikethrough if checked.
    private var itemNameView: some View {
        Text(item.name)
            .font(.headline)
            .strikethrough(item.isChecked, color: item.isChecked ? Color.black : .none)
            .frame(alignment: .leading)
    }

    /// View for displaying additional details like units and price of the item.
    private var itemDetailsView: some View {
        HStack {
            if let units = item.units, let measure = item.measure {
                Text("\(units) \(measure)")
                    .frame(alignment: .leading)
            } else {
                Text("")
                    .frame(alignment: .leading)
            }
            
            Spacer()
            
            if let price = item.price {
                Text("€ \(String(format: "%.2f", price))")
            }
        }
        .font(.subheadline)
    }
}

#Preview {
    ListRowView(item: MockData.sampleItem) // Preview setup with a sample item.
}
