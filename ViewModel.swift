//
//  ViewModel.swift
//  MiniProject
//
//  Created by Austin Huguenard on 1/31/25.
//

import Foundation

// TODO: What protocol does the ViewModel need to ensure its variable is kept track of on the UI?
class ViewModel: ObservableObject {
    // TODO: What wrapper does this variable need to keep track of the changes on the UI?
    @Published var lists: [ItemList] = [
        // TODO: Instantiate some ItemLists here to see them in the preview
        ItemList("Grocery list"),
        ItemList("Work list")
    ]
    
    func createNewList() {
        // TODO: Creates a new empty ItemList with a default name and adds it to the lists variable
        lists.append(ItemList("New List")) //**default value/empty list
    }
    
    func addItem(to list: ItemList, name: String) {
        list.items.append(ItemList.Item(name)) // appends to the given list - ItemList.Item explicitly says Use Item inside ItemList
    }
    
    
    func toggleItemAsCompleted(_ item: ItemList.Item, _ list: ItemList) {
        // Find the correct list inside `lists`
        if let listIndex = lists.firstIndex(where: { $0.id == list.id }) {
            // Find the correct item inside that list
            if let itemIndex = lists[listIndex].items.firstIndex(where: { $0.id == item.id }) {
                lists[listIndex].items[itemIndex].isCompleted.toggle() // Toggle completion
            }
        }
    }

}
