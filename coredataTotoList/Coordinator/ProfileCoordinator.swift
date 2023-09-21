//
//  ProfileCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
   
    var dataManager: ViewModel?
    
    func start(vc: UIViewController) {
        let profileVC = ProfileViewController(viewModel: dataManager!)
        profileVC.coordinator = self
        profileVC.modalPresentationStyle = .fullScreen
        profileVC.viewModel = dataManager!
        vc.present(profileVC, animated: true)
    }
    
    
    func back(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
    
    deinit {print("profileVC 해제")}
}

