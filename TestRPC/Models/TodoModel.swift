//
//  TodoModel.swift
//  TestRPC
//
//  Created by Gyeongtae Nam on 2022/09/22.
//

import Foundation

class TodoModel: ObservableObject {
    
    @Published var items = [Todo]()
    
    
    func load() {
        DataRepository.shared.client.fetchTodos(Todos_Empty()).response.whenSuccess { list in
            DispatchQueue.main.async {
                self.items.removeAll()
                for todo in list.todos {
                    self.items.append(Todo(todo) )
                }
            }
        }
    }
    

    
    func delete(id: String ) {
        let request = Todos_TodoID.with { input in
            input.todoID = id
        }
        DataRepository.shared.client.deleteTodo(request).response.whenSuccess { empty  in
            self.load()
        }
    }
    
    func create(todo: Todo ) {
        let request = Todos_Todo(todo)
        DataRepository.shared.client.createTodo(request).response.whenSuccess { todo in
            
        }
    }
}
