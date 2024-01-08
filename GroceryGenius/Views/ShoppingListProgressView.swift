//
//  ShoppingListProgressView.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 08.01.24.
//

import SwiftUI

struct ShoppingListProgressView: View {
    
    @ObservedObject var listViewModel: ListViewModel
    
    var body: some View {
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
}

#Preview {
    ShoppingListProgressView(listViewModel: ListViewModel())
}
