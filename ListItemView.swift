//
//  ListItemView.swift
//  MiniProject
//
//  Created by Austin Huguenard on 1/31/25.
//

import SwiftUI

struct ListItemView: View {
    let viewModel = ViewModel() //instantiates ViewModel class to use its methods
    
    // TODO: What wrapper does itemList need to ensure changes in this are registered on the screen?
    @StateObject var itemList: ItemList
    
    // TODO: What wrapper does listName need to ensure changes in this are registered on the screen?
    @State var listName: String = ""
    
    // HINT: The modifiers on these two variables is different!
    
    var body: some View {
        VStack {
            Button("Add New Item") {
                // TODO: Add a function call here to create a new Item for the list
                viewModel.addItem(to: itemList, name: "New Item") //**test
            }
            // TODO: Add modifiers here to make the button pretty!
            .padding(15)
            .font(.system(size: 24))
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(5)
            
            List {
                ForEach($itemList.items) { $item in
                    HStack {
                        Button {
                            withAnimation {
                                // ✅ Use `$item.isCompleted.toggle()` to correctly modify the state
                                $item.isCompleted.wrappedValue.toggle()
                                //if we use binding variable $, need to use .wrappedValue
                            }
                        } label: {
                            Image(systemName: $item.isCompleted.wrappedValue ? "checkmark.circle.fill" : "circle") // ✅ Use wrappedValue
                                .foregroundColor($item.isCompleted.wrappedValue ? .blue : .gray)
                        }

                        TextField("", text: $item.name)
                    }
                }
            }
            
            HStack {
                TextField("Input List Name", text: $listName)
                    // TODO: Add modifiers here to make the text field pretty!
                    .padding(5)
                    .font(.system(size: 28))
                    .foregroundColor(Color.black)
                    .background(Color.gray)
                    .cornerRadius(5)
                    
                Button("Rename") {
                    // TODO: Make function calls here to rename the list and clear the contents of the text field
                    itemList.updateListName(newName: listName)
                    listName = "" //Clear text field after renaming
                }
                // TODO: Add modifiers here to make the button pretty and enable/disable!
                .padding(5)
                .font(.system(size: 28))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(5)
                .disabled(listName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) // ✅ Disable when empty
                .opacity(listName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1) // ✅ Faded when disabled
            }
            .padding(10)
        }
        .navigationTitle(itemList.name)
    }
}

#Preview {
    ListItemView(itemList: ItemList(""))
}
