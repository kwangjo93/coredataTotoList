//
//  CompletedCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class CompletedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var completedVC = CompletedViewController(viewModel: dataManager)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(vc: UIViewController, viewModel: AnyObject) {
        let completedController = completedVC
        navigationController.pushViewController(completedController, animated: false)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
