//
//  ViewController.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var coordinator: TodoListCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test Coordinator"
        self.view.backgroundColor = .systemBackground
    }


}

