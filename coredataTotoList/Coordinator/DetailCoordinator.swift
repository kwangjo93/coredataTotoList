//
//  DetailCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class DetailCoordinator: Coordinator {
 
    var navigationController: UINavigationController
//    let coredataManager = CoreDataManager()
//    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    var dataManager: ViewModel?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let dataManager = dataManager else { return }
        let DetailVC = DetailViewController(viewModel: dataManager)
        DetailVC.coordinator = self
        DetailVC.viewModel = dataManager
        navigationController.pushViewController(DetailVC, animated: true)
    }
    
    func eidtStart(task: Task, indexPath: IndexPath) {
//        let detailontroller = DetailVC
        let DetailVC = DetailViewController(viewModel: dataManager!)
        DetailVC.coordinator = self
        DetailVC.viewModel = self.dataManager!
        DetailVC.editMode = .edit
        DetailVC.task = task
        DetailVC.indexPath = indexPath
        navigationController.pushViewController(DetailVC, animated: true)
    }
    
    deinit {print("DetailVC 해제")}
}
