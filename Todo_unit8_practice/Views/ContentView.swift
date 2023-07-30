//
//  ContentView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo(title: "Feed the cat", isCompleted: true),
    Todo(title: "Complete Unit8"),
                                Todo(title: "Add Score Function in Rehab", subTitle: "To calculate progress"),
    Todo(title: "Push code to GitHub")]
    
    @State private var showAddSheet = false
    
    var body: some View {
        
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label: {
                    TodoRowView(todo: $todo)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                NewTodoView(sourceArray: $todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
