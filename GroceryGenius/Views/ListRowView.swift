//
//  ListRowView.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 27.11.23.
//

import SwiftUI

struct ListRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let item: ItemModel

    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            HStack(alignment: .top) {
                itemImageView

                VStack(alignment: .leading) {
                    itemNameView
                    Spacer()
                    itemDetailsView
                }
                .padding(.trailing, 7)
                .padding(.vertical, 7)
            }
            .background(item.isChecked ? Color.gray : Color.theme.card)
            .cornerRadius(10)
        }
    }

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

    private var itemNameView: some View {
        Text(item.name)
            .font(.headline)
            .strikethrough(item.isChecked, color: item.isChecked ? Color.black : .none)
            .frame(alignment: .leading)
    }

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
    ListRowView(item: MockData.sampleItem)
}
