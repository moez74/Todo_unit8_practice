//
//  HowManyMoreView.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 8/7/23.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect: true)!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("You have ^[\(todoManager.numTodosNotDone) todos](inflect: true) left.")
                .padding()
        }
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
