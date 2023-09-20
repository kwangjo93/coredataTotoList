//
//  ProfileCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
   
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var profileVC = ProfileViewController(viewModel: dataManager)
    
    func start(vc: UIViewController, viewModel: AnyObject) {
        let profileVCController = profileVC
        profileVCController.coordinator = self
        profileVCController.modalPresentationStyle = .fullScreen
        profileVCController.viewModel = viewModel as! ViewModel
        vc.present(profileVCController, animated: true)
    }
    
    lazy var viewmodel = profileVC.viewModel
    
    
    func back() {
        profileVC.dismiss(animated: true)
    }
    
    deinit {print("profileVC 해제")}
}

