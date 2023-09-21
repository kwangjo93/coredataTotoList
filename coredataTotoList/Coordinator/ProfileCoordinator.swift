//
//  ProfileCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
   
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var profileVC = ProfileViewController(viewModel: dataManager)
    
    func start(vc: UIViewController) {
        var profileVC = ProfileViewController(viewModel: dataManager)
        profileVC.coordinator = self
        profileVC.modalPresentationStyle = .fullScreen
        profileVC.viewModel = dataManager
        vc.present(profileVC, animated: true)
    }
    
    
    func back(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
    
    deinit {print("profileVC 해제")}
}

