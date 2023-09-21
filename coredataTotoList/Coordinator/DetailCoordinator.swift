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
        let detailontroller = DetailVC
        detailontroller.coordinator = self
        detailontroller.viewModel = viewModel as! ViewModel
        detailontroller.editMode = .new
        navigationController.pushViewController(detailontroller, animated: true)
    }
    
    func eidtStart(viewModel: ViewModel, task: Task, indexPath: IndexPath) {
        let detailontroller = DetailVC
        detailontroller.coordinator = self
        detailontroller.viewModel = viewModel
        detailontroller.editMode = .edit
        detailontroller.task = task
        detailontroller.indexPath = indexPath
        navigationController.pushViewController(detailontroller, animated: true)
    }
    
    lazy var viewmodel = DetailVC.viewModel
    
    deinit {print("DetailVC 해제")}
}
