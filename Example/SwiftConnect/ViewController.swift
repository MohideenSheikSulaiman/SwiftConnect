//
//  ViewController.swift
//  Connect
//
//  Created by Tarek Sabry on 05/18/2020.
//  Copyright (c) 2020 Tarek Sabry. All rights reserved.
//

import UIKit
import SwiftConnect

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodo()
    }
    
    func fetchTodo() {
        Connect.default.request(TodoConnector.get(id: 123), debugResponse: true).decoded(toType: Todo.self).observe { result in
            switch result {
            case .success(let todo):
                print(todo)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateTodo() {
        Connect.default.request(AdvancedTodoConnector.update(userId: 1, todoId: 2, action: .update, object: Todo(id: 1, userId: 2, title: "Test Todo", completed: false)), debugResponse: true).observe { result in
            print(result)
        }
    }

}
