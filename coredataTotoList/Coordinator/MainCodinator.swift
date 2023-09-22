//
//  MainCodinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//


import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

   
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)

    let todocordi: TodoCoordinator
    let completedcoordi: CompletedCoordinator
    let profilecoordi: ProfileCoordinator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        todocordi = TodoCoordinator(navigationController: navigationController)
        completedcoordi = CompletedCoordinator(navigationController: navigationController)
        profilecoordi = ProfileCoordinator(navigationController: navigationController)
    }

    func start() {
        let mainVC = MainViewController(viewModel: dataManager)
        mainVC.coordinator = self
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    func todoShow() {
        todocordi.dataManager = self.dataManager
        todocordi.start()
    }
    
    func completedShow() {
        completedcoordi.dataManager = self.dataManager
        completedcoordi.start()
    }

    func profilePresent() {
        profilecoordi.dataManager = self.dataManager
        profilecoordi.start()
    }
}
