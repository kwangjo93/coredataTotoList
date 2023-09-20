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

    func loadCategories() {
        coredataManager.loadCategories()
    }
    
    func categoryArray() -> [Category] {
        return coredataManager.categoryArray
    }
    
    func removeALl() {
        coredataManager.dataRemove()
    }
    
    func updateIsCompleted(task: Task, isCompleted: Bool) {
        for index in 0..<coredataManager.categoryArray.count {
            let category = coredataManager.categoryArray[index]
            
            // 카테고리 내의 모든 Task 배열 순회
            for taskIndex in 0..<(category.task?.count ?? 0) {
                if let categoryTask = category.task?[taskIndex], categoryTask.id == task.id {
                   
                    categoryTask.isCompleted = isCompleted
                    // 이 부분에서 Core Data에 변경사항 저장하는 로직이 필요할 수 있습니다.
                    coredataManager.saveChangesToCoreData()
                }
            }
        }
    }
    
    
}
