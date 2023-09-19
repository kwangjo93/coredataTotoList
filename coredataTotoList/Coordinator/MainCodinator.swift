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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainViewController = mainVC
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
//    func todoShow() {
//        let todoCoordinator = TodoCoordinator(navigationController: navigationController)
//        todoCoordinator.start(vc: mainVC, viewModel: dataManager as ViewModel)
//    }
//
//    func completedShow() {
//        let compledtedCoordinator = CompletedCoordinator(navigationController: navigationController)
//        compledtedCoordinator.start(vc: mainVC, viewModel: dataManager as ViewModel)
//    }
//
//    func profilePresent() {
//        let ProfileCoordinator = ProfileCoordinator()
//        mainVC.present(ProfileCoordinator.profileVC, animated: true)
//        ProfileCoordinator.start(vc: mainVC, viewModel: dataManager as ViewModel)
//    }
    
}
