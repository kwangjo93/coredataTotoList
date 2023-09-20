//
//  MainCodinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//


import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var mainVC = MainViewController(viewModel: dataManager)
    
    let todocordi: TodoCoordinator
    let completedcoordi: CompletedCoordinator
    let profilecoordi: ProfileCoordinator
    
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        todocordi = TodoCoordinator(navigationController: navigationController)
        completedcoordi = CompletedCoordinator(navigationController: navigationController)
        profilecoordi = ProfileCoordinator()
    }

    func start() {
        let mainViewController = mainVC
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    
    func todoShow() {
        todocordi.start(vc: mainVC, viewModel: self.dataManager)
    }
    
    func completedShow() {
        completedcoordi.start(vc: mainVC, viewModel: self.dataManager)
    }

    func profilePresent() {
        profilecoordi.start(vc: mainVC, viewModel: self.dataManager)
    }
    
}
