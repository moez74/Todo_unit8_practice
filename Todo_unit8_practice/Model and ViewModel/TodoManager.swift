//
//  TodoManager.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/30/23.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    @Published var searchTerm = ""
    
    var todosFiltered: Binding<[Todo]> {
        Binding (
            get: {
                if self.searchTerm == "" {
                    return self.todos
                }
                return self.todos.filter {
                    $0.title.lowercased().contains(self.searchTerm.lowercased())
                }
            },
            set: { [self] in
                todos = $0
            }
        )
    }
        
    var numTodosDone: Int {
        todos.filter{$0.isCompleted}.count
    }
    
    var numTodosNotDone: Int {
        todos.filter{!$0.isCompleted}.count
    }
    
    init() {
        load()
    }
    
    func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
