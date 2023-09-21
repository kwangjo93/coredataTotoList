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
        todocordi.start()
    }
    
    func completedShow() {
        completedcoordi.start()
    }

    func profilePresent(vc: UIViewController) {
        profilecoordi.start(vc: vc)
    }
    
}
