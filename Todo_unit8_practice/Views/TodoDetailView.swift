//
//  TodoDetailView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/25/23.
//

import SwiftUI

struct TodoDetailView: View {
    
    //@State var todo = Todo(title: "Some Todo", subTitle: "Some SubTitle", isCompleted: false)
    @Binding var todo: Todo
    
    
    var body: some View {
        Form {
            TextField(todo.title, text: $todo.title)
            TextField(todo.subTitle, text: $todo.subTitle)
                .foregroundColor(.gray)
            Toggle("Completed", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Some Title")))
    }
}
