//
//  ViewModel.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

class ViewModel {
    
    private let coredataManager: DataListType
    
    //의존성 주입
    init(coredataManager: DataListType) {
        self.coredataManager = coredataManager
    }
    
    
    func dataLoad() -> [Category] {
        return coredataManager.getToDoListFromCoreData()
    }
    
    func creatData(title: String, category: Category, index: Int, completion: @escaping () -> Void) {
        coredataManager.saveToDoData(title: title, category: [category], index: index, completion: completion)
    }
    
    func deleteData(category: Category, index: Int, indexPath: Int, completion: @escaping () -> Void) {
        coredataManager.deleteToDo(category: [category], index: index, indexPath: indexPath, completion: completion)
    }
    
    func updateData(category: Category, index: Int, indexPath: Int, newToDoData: Task, completion: @escaping () -> Void) {
        coredataManager.updateToDo(category: [category], index: index, indexPath: indexPath, newToDoData: newToDoData, completion: completion)
    }

    
}
