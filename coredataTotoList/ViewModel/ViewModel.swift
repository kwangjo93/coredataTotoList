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

    
    func getData() -> [Task] {
        return coredataManager.getToDoListFromCoreData()
    }
    
    func creatData(id: UUID, title: String, image:UIImage, vc: UIViewController) {
        coredataManager.saveToDoData(id: id, title: title, image: image) {
            print("저장완료")
            vc.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func deleteData(task: Task, completion: @escaping () -> Void) {
        coredataManager.deleteToDo(task: task, completion: completion)
    }
    
    func updateData(task: Task, vc: UIViewController) {
        coredataManager.updateToDo(newToDoData: task) {
            print("저장완료")
            vc.navigationController?.popViewController(animated: true)
        }
    }

    func saveData() {
        coredataManager.saveChangesToCoreData()
    }
    
    func removeALl() {
        coredataManager.dataRemove()
    }
    
    func updateIsCompleted(task: Task, isCompleted: Bool) {
            // 카테고리 내의 모든 Task 배열 순회
        var listData = coredataManager.getToDoListFromCoreData()
        for taskIndex in 0..<listData.count {
            if listData[taskIndex].id?.uuidString == task.id?.uuidString {
                    task.isCompleted = isCompleted
                    coredataManager.saveChangesToCoreData()
                }
            }
        }

    
}
