//
//  Coordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

@objc protocol Coordinator: AnyObject {
    @objc optional var navigationController: UINavigationController { get set }
    @objc optional func start()
    @objc optional func start(vc: UIViewController, viewModel: AnyObject)
}


class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
    }
    
    
}
