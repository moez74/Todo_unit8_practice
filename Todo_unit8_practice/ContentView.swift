//
//  ContentView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title: "Feed the cat"),
    Todo(title: "Complete Unit8"),
                                Todo(title: "Add a Score calculation function in App"),
    Todo(title: "Push code to GitHub")]
    
    var todos1 = ["1","2",""]
    
    var body: some View {
        
        NavigationStack {
            List(todos) { todo in
                Text(todo.title)
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
