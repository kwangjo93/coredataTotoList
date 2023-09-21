//
//  CoreDatamanager.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import CoreData

protocol DataListType {
    func getToDoListFromCoreData() -> [Task]
    func saveToDoData(id: UUID, title: String, image:UIImage, completion: @escaping () -> Void)
    func deleteToDo(task: Task?, completion: @escaping () -> Void)
    func updateToDo(newToDoData: Task, completion: @escaping () -> Void)
    func dataRemove()
    func saveChangesToCoreData()
}


final class CoreDataManager: DataListType {

    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //코어데이터 저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Task"
    
    
    func saveChangesToCoreData() {
        guard let context = context else {
            return
        }
        
        do {
            try context.save() // 변경 사항을 저장
            print("Core Data 변경 사항 저장 성공")
        } catch {
            print("Core Data 변경 사항 저장 실패: \(error.localizedDescription)")
        }
    }
    
    //모든 데이터 삭제
    func dataRemove() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Task")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context?.execute(batchDeleteRequest)
            print("모든 데이터 삭제 성공")
            
            // 이후에 새로운 데이터를 추가하거나 초기 데이터 생성 메서드를 호출합니다.
        } catch {
            print("데이터 삭제 실패: \(error.localizedDescription)")
        }
    }
    
    
    // MARK: - [Read]
    func getToDoListFromCoreData() -> [Task] {
        var toDoList: [Task] = []
  
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.returnsObjectsAsFaults = false
//            let dateOrder = NSSortDescriptor(key: "creatDate", ascending: false)
//            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    toDoList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        return toDoList
    }
    
    // MARK: - [Create]
    func saveToDoData(id: UUID, title: String, image: UIImage, completion: @escaping () -> Void) {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? Task {
                    
                    toDoData.id = id
                    toDoData.createData = Date()   // 날짜는 저장하는 순간의 날짜로 생성
                    toDoData.isCompleted = true
                    toDoData.title = title
                    toDoData.mainImage = image.pngData()!
                    toDoData.modifyDate = Date()
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - [Delete]
    func deleteToDo(task: Task?, completion: @escaping () -> Void) {
        guard let id = task?.id else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    
                    if let targetToDo = fetchedToDoList.first {
                        context.delete(targetToDo)
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update] 
    func updateToDo(newToDoData: Task, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let id = newToDoData.id else {
            completion()
            return
        }
        
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)

            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            request.returnsObjectsAsFaults = false
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    if var targetToDo = fetchedToDoList.first {
                        
                        
                        
                        targetToDo = newToDoData
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
            } catch {
                print("업데이트 실패")
                completion()
            }
        }
    }
}
