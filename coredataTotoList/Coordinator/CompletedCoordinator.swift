//
//  CompletedCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class CompletedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
//    let coredataManager = CoreDataManager()
//    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    var dataManager: ViewModel?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let completedVC = CompletedViewController(viewModel: dataManager!)
        completedVC.coordinator = self
        completedVC.viewModel = self.dataManager!
        navigationController.pushViewController(completedVC, animated: true)
    }
    
    deinit {print("completedVC 해제")}
}
