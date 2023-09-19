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
    
    func start(vc: UIViewController) {
        let todoController = todoVC
        vc.navigationController?.pushViewController(todoController, animated: true)
    }
    
    lazy var viewmodel = todoVC.viewModel
    
    deinit {print("todoVC 해제")}
}

