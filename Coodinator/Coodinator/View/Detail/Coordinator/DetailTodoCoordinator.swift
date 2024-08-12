//
//  DetailTodoCoordinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//


import UIKit

class DetailTodoCoordinator: Coordinator {
    var navigationController: UINavigationController
    var todoItem: TodoListModel
    
    init(navigationController: UINavigationController, todoItem: TodoListModel) {
        self.navigationController = navigationController
        self.todoItem = todoItem
    }
    
    func start() {
        let detailTodoViewModel = DetailTodoViewModel(todoItem: todoItem)
        let detailTodoViewController = DetailTodoViewController()
        detailTodoViewController.viewModel = detailTodoViewModel
        navigationController.pushViewController(detailTodoViewController, animated: true)
    }
    
    
}
