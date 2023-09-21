//
//  TodoCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class TodoCoordinator: Coordinator {
  
    var navigationController: UINavigationController
//    let coredataManager = CoreDataManager()
//    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    var dataManager: ViewModel?
//    lazy var todoVC = TodoViewController(viewModel: dataManager)
    let detailCoordi: DetailCoordinator
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.detailCoordi = DetailCoordinator(navigationController: navigationController)
    }
    
    func start() {
        var todoVC = TodoViewController(viewModel: dataManager!)
        todoVC.coordinator = self
        todoVC.viewModel = self.dataManager!
        navigationController.pushViewController(todoVC, animated: true)
    }
    
    func newDetailShow() {
        detailCoordi.dataManager = self.dataManager
        detailCoordi.start()
    }
    
    func updateDetailShow(task: Task, indexPath: IndexPath) {
        detailCoordi.dataManager = self.dataManager
        detailCoordi.eidtStart(task: task, indexPath: indexPath)
    }
 
    deinit {print("todoVC 해제")}
}

