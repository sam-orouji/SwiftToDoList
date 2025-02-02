//
//  Model.swift
//  MiniProject
//
//  Created by Austin Huguenard on 1/31/25.
//

import Foundation

// Notice the protocols on this class
// Identifiable: must have an id var that has a unique id for each instance (UUID.init() creates this unique id)
// Equatable: We must have the static func == to define how the instances are compared, similar to compareTo in Java
// ObservableObject: We only declare a class this if we want the views using the class to respond to changes in the variables. What does that mean we should add in front of the variables displayed on views in this class? **published
class ItemList: Identifiable, Equatable, ObservableObject {
    static func == (lhs: ItemList, rhs: ItemList) -> Bool {
        lhs.name == rhs.name
    }
    
    var id: UUID = .init()
    
    // TODO: What wrapper does the name variable need to keep track of it on the UI?
    @Published var name: String
    
    // TODO: We need a variable to keep track of the Items in the ItemList class, and it needs the same wrapper as the name variable
    @Published var items: [Item] = []

    //ItemList constructor
    init(_ name: String) {
        self.name = name
    }
    
    
    // Structs are automatically Equatable because they are immutable, but we must set the id variable with a unique UUID
    struct Item: Equatable, Identifiable {
        var id: UUID = .init()
        
        // TODO: What other properties would Item have? HINT: two needed, one should have a default value
        var name: String
        var isCompleted: Bool = false //default value
        
        //item constructor
        init(_ name: String/* TODO: Pass a property of item here for instantiation */) {
            // TODO: Set the self value here to the value passed in the init function
            self.name = name
        }
        
        // TODO: Create a (Void) function to rename the Item. HINT: Because structs are immutable by default, you need to use the mutating keyword before func to update the value
        mutating func rename(name: String) {
            self.name = name
        }
        
    }
    
    
    func addItem(_ name: String) { //*_ removes requiring the label name: when calling the function
        // TODO: Create an Item object with the given name, and add it to this ItemList
        self.items.append(Item(name))
    }
    
    func toggleItemAsCompleted(_ item: Item) {
        // TODO: Toggle the given Item as complete/incomplete in this ItemList
        // loop through list to find item and return it/mark that item.IsCompleted = true

        //more efficient code via closures/firstIndex(where:
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle() // Swift vibes only
        }
    }
    
    func updateListName(newName: String) {
        // TODO: Add logic here to rename the list
        self.name = newName
    }
}
