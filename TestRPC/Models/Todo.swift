//
//  Todo.swift
//  TestRPC
//
//  Created by Gyeongtae Nam on 2022/09/22.
//

import Foundation

struct Todo: Identifiable {
    var id: UUID?
    var title: String
    var completed: Bool
    

    init(id: UUID? = nil , title : String, completed: Bool = false ) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

extension Todos_Todo {
    init(_ todo: Todo) {
        if let todoid = todo.id {
            self.todoID = todoid.uuidString
        }
        self.completed = todo.completed
        self.title = todo.title
    }
}

extension Todo {
    init(_ todo: Todos_Todo) {
        self.init(id: UUID(uuidString: todo.todoID),
                  title: todo.title,
                  completed: todo.completed
        )
    }
}
