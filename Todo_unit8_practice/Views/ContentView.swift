//
//  ContentView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    @State private var showAddSheet = false
    
    var body: some View {
        
        NavigationStack {
            List($todoManager.todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
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
                NewTodoView(sourceArray: $todoManager.todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
