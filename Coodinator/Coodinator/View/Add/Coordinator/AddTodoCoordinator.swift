//
//  AddTodoCoordinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

class AddTodoCoordinator: Coordinator {
    var navigationController: UINavigationController

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addTodoVC = AddTodoViewController()
        addTodoVC.modalPresentationStyle = .fullScreen
        addTodoVC.coordinator = self
        
        navigationController.present(addTodoVC, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    

    
    
}
