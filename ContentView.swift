//
//  ContentView.swift
//  MiniProject
//
//  Created by Austin Huguenard on 1/31/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // TODO: What modifier does the view model need to ensure the variables in it are reflected correctly on screen?
    @StateObject var viewModel = ViewModel() //  tracks changes

    
    var body: some View {
        NavigationView {
            /* TODO: What type of View do you use here to put things vertically next to each other on the screen? */
            VStack{
                
                // Shorthand to do a ForEach of a list using a closure!
                List(viewModel.lists) { list in
                    // TODO: Use a NavigationLink to select a list.
                    NavigationLink(destination: ListItemView(itemList: list)) {
                        Text(list.name)
                    }
                }
                
                Button(action: {
                    // TODO: Add a function to create a new list
                        viewModel.createNewList()
                    
                }, label: {
                    // TODO: Give the button text and a nice background
                    Text("Create New List")
                        .padding(15)
                        .font(.system(size:24))
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                })
            }
            .navigationTitle("Lists")
            // This ensures the list on screen is updated everytime you navigate back to the screen
            .onAppear {
                viewModel.lists = viewModel.lists
            }
        }
    }
}

#Preview {
    ContentView()
}

