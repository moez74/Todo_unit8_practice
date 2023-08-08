//
//  MainTodoListView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 8/7/23.
//

import SwiftUI

struct MainTodoListView: View {
    
    @ObservedObject var todoManager: TodoManager
    @State private var showAddSheet = false
    @State private var sampleDataAlert = false
    
    @State var searchItem = ""
    
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
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    #if DEBUG
                    Button {
                        sampleDataAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                    #endif
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
            .alert("Load sample data?", isPresented: $sampleDataAlert) {
                Button("Replace", role: .destructive){
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
