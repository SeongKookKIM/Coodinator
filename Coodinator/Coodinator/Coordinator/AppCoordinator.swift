//
//  AppCoodinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let todoListCoordinator = TodoListCoordinator(navigationController: navigationController)
        todoListCoordinator.start()
    }
    
    
}
