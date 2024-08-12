//
//  TodoListCoordinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import Foundation
import UIKit

class TodoListCoordinator: Coordinator {
    var navigationController: UINavigationController
    var todoListViewController: TodoListViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let todoListVC = TodoListViewController()
        todoListVC.coordinator = self
        
        navigationController.pushViewController(todoListVC, animated: true)
        self.todoListViewController = todoListVC
    }
}
