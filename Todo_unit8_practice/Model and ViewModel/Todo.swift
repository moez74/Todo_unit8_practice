//
//  Todo.swift
//  Todo_unit8_practice
//
//  Created by Moez Rehman on 7/24/23.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id =  UUID()
    //var id: Int
    
    var title: String
    var subTitle = ""
    var isCompleted = false
}

