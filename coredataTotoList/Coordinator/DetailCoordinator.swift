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
        let detailVC = DetailViewController(viewModel: dataManager)
        detailVC.coordinator = self
        detailVC.viewModel = dataManager
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func eidtStart(task: Task, indexPath: IndexPath) {
        let detailVC = DetailViewController(viewModel: dataManager!)
        detailVC.coordinator = self
        detailVC.viewModel = self.dataManager!
        detailVC.editMode = .edit
        detailVC.task = task
        detailVC.indexPath = indexPath
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func detailShow(task: Task) {
        let detailVC = DetailViewController(viewModel: dataManager!)
        detailVC.coordinator = self
        detailVC.viewModel = self.dataManager!
        detailVC.editMode = .edit
        detailVC.task = task
        navigationController.present(detailVC, animated: true)
    }
    
    deinit {print("DetailVC 해제")}
}
