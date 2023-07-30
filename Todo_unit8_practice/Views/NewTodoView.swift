//
//  NewTodoView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/25/23.
//

import SwiftUI

struct NewTodoView: View {
    
    @State private var title = ""
    @State private var subTitle = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subTitle)
            }
            Section("Actions") {
                Button {
                    let todo = Todo(title: title, subTitle: subTitle)
                    sourceArray.append(todo)
                    dismiss()
                    
                } label: {
                    Text("Save")
                }
                
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
