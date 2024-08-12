//
//  TodoListVewModel.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import Foundation
import Combine

class TodoListVewModel {
    @Published var todoList: [TodoListModel] = [TodoListModel(id: UUID(), title: "Test1", content: "Test22"),
                                     TodoListModel(id: UUID(), title: "Test입니다.", content: "테스트지롱")]
    
    func addTodoList(item: TodoListModel) {
        todoList.append(item)
    }
}
