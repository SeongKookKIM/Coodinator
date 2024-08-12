//
//  AddTodoCoordinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

protocol AddTodoCoordinatorDelegate: AnyObject {
    func addTodoCoordinator(_ coordinator: AddTodoCoordinator, didAddTodo todo: TodoListModel)
}

class AddTodoCoordinator: Coordinator {
    var navigationController: UINavigationController
    weak var delegate: AddTodoCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addTodoVC = AddTodoViewController()
        addTodoVC.modalPresentationStyle = .fullScreen
        addTodoVC.coordinator = self
        addTodoVC.addTodoHandler = { [weak self] newTodo in
            self?.delegate?.addTodoCoordinator(self!, didAddTodo: newTodo)
        }
        
        navigationController.present(addTodoVC, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
