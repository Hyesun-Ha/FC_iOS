//
//  TodoManager.swift
//  TodoList
//
//  Created by 하혜선 on 2020/09/01.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class TodoManager {
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
        if let index = todos.firstIndex(of: todo) {
            todos.remove(at: index)
        }
        
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
        guard let index = todos.firstIndex(of: todo) else {
            return
        }
        
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}
