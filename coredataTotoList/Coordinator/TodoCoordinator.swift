//
//  TodoCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class TodoCoordinator: Coordinator {
  
    var navigationController: UINavigationController
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var todoVC = TodoViewController(viewModel: dataManager)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(vc: UIViewController, viewModel: AnyObject) {
        let todoController = todoVC
        navigationController.pushViewController(todoController, animated: false)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}

