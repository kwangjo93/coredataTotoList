//
//  DetailCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

final class DetailCoordinator: Coordinator {
 
    var navigationController: UINavigationController
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
