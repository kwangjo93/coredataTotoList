//
//  TodoCoordinator.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//

import UIKit

class TodoCoordinator: Coordinator {
  
    var navigationController: UINavigationController
    let coredataManager = CoreDataManager()
    lazy var dataManager = ViewModel(coredataManager: coredataManager)
    lazy var todoVC = TodoViewController(viewModel: dataManager)
    let detailCoordi: DetailCoordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        detailCoordi = DetailCoordinator(navigationController: navigationController)
    }
    
    func start(vc: UIViewController, viewModel: AnyObject) {
        let todoController = todoVC
        todoController.coordinator = self
        todoController.viewModel = viewModel as! ViewModel
        vc.navigationController?.pushViewController(todoController, animated: true)
    }
    
    func newDetailShow() {
        detailCoordi.start(vc: todoVC, viewModel: self.dataManager)
    }
    
    func updateDetailShow(task: Task, indexPath: IndexPath) {
        detailCoordi.eidtStart(viewModel: self.dataManager, task: task, indexPath: indexPath)
    }
    
    
    lazy var viewmodel = todoVC.viewModel
    
    deinit {print("todoVC 해제")}
}

