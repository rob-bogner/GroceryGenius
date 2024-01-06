//
//  AddItemView.swift
//  GroceryGenius
//
//  Created by Robert Bogner on 04.12.23.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var item: String = ""
    @FocusState private var addItemFocus: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button( action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.gray)
            })
            .frame(alignment: .trailing)
            .padding(.top)
            .padding(.trailing)
            
            Text("Add an item")
                .padding(.horizontal)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter item name here", text: $item)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .focused($addItemFocus)
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                addItemFocus = true
                    }
        }
        
        VStack {
            Button(action: {
                    addItemPressed()
                    dismiss()
                }, label: {
                    Text("Add item to list")
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    
            })
        }
            Spacer()
            
    }
    
    func addItemPressed() {
        listViewModel.addItem(name: item)
    }
}

#Preview {
    AddItemView()
        .environmentObject(ListViewModel())
}
