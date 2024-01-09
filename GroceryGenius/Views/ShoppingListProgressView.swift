/*
GroceryGenius
ShoppingListProgressView.swift
Created by Robert Bogner on 08.01.24.

Provides a visual representation of the shopping list's completion progress.
*/

import SwiftUI

/// A view that displays the progress of items being checked off in the shopping list.
struct ShoppingListProgressView: View {
    
    @ObservedObject var listViewModel: ListViewModel // ViewModel providing data for progress calculation.

    var body: some View {
        VStack(alignment: .leading) {
            Text("Shopping progress") // Title for the progress view.
                .font(.caption2)
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
            HStack {
                Group {
                    Image(systemName: "basket") // Icon representing the shopping list.
                    ProgressView(value: listViewModel.progressFraction) // Progress bar showing the fraction of items checked.
                    Text("\(listViewModel.checkedItemCount)/\(listViewModel.totalItemCount)") // Text displaying the number of checked items vs. total items.
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity) // Ensuring the progress view extends across the available width.
            .background(Color.theme.card) // Background color for the progress view.
            .cornerRadius(10) // Rounded corners for aesthetic appeal.
            .padding(.horizontal, 20) // Padding to maintain layout consistency.
        }
    }
}

#Preview {
    ShoppingListProgressView(listViewModel: ListViewModel()) // Preview setup with a ListViewModel for visual testing.
}
