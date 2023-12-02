//
//  ProfileCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let detailCoordi: DetailCoordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        detailCoordi = DetailCoordinator(navigationController: navigationController)
    }
   
    var dataManager: ViewModel?
    
    func start() {
        let profileVC = ProfileViewController(viewModel: dataManager!)
        profileVC.coordinator = self
        profileVC.viewModel = dataManager!
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func detailShow(task: Task) {
        detailCoordi.dataManager = self.dataManager
        detailCoordi.detailShow(task: task)
    }
    
    
    func back(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
    
    deinit {print("profileVC 해제")}
}

