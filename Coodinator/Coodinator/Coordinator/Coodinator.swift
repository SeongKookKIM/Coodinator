//
//  Coodinator.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    
}
