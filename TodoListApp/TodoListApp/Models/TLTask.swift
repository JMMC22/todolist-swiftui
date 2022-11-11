//
//  TLTask.swift
//  TodoListApp
//
//  Created by Jose Mari on 11/11/22.
//

import Foundation


struct TLTask: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
