//
//  TodoRowView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/25/23.
//

import SwiftUI

struct TodoRowView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        NavigationLink {
            TodoDetailView(todo: $todo)
        } label: {
            HStack {
                Image(systemName: todo.isCompleted ?  "checkmark.circle.fill" : "circle")
                    .onTapGesture {
                        todo.isCompleted.toggle()
                    }
                
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                    
                    if !todo.subTitle.isEmpty {
                        Text(todo.subTitle)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .strikethrough(todo.isCompleted)
                    }
                }
            }
        }
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(Todo(title: "Some Title", subTitle: "Some Subtitle")))
    }
}
