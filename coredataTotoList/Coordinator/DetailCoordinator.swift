//
//  DetailCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class DetailCoordinator: Coordinator {
 
    var navigationController: UINavigationController
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var DetailVC = DetailViewController(viewModel: dataManager)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(vc: UIViewController, viewModel: AnyObject) {
        let Detailontroller = DetailVC
        navigationController.pushViewController(Detailontroller, animated: false)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
