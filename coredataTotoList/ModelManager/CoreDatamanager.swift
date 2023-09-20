//
//  CoreDatamanager.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import CoreData


protocol DataListType {
    var categoryArray: [Category] { get set}
    func createAndSaveCategories()
    func loadCategories()
    func  saveChangesToCoreData()
    func getToDoListFromCoreData() -> [Category]
    func saveToDoData(title: String, category: [Category], index: Int, completion: @escaping () -> Void)
    func deleteToDo(category: [Category], index: Int, indexPath: Int, completion: @escaping () -> Void)
    func updateToDo(category: [Category], index: Int, indexPath: Int, newToDoData: Task, completion: @escaping () -> Void)
    func dataRemove()
}


final class CoreDataManager: DataListType {
 
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //코어데이터 저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔터티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "Category"
    
    var categoryArray: [Category] = []
    
    internal func createAndSaveCategories() {
        guard let context = context else { return }
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        do{
            let existingCategories = try context.fetch(fetchRequest)
            
            if existingCategories.isEmpty {
                let entityDescription = NSEntityDescription.entity(forEntityName: "Category", in: context)!

                
                
                // 데이터 생성 및 저장
                let section1 = Category(entity: entityDescription, insertInto: context)
                section1.title = "work"
                section1.id = UUID()

                let section2 = Category(entity: entityDescription, insertInto: context)
                section2.title = "Chores"
                section2.id = UUID()

                let section3 = Category(entity: entityDescription, insertInto: context)
                section3.title = "Learning"
                section3.id = UUID()
                
                try context.save()
                print("데이터 저장 성공")
            }
        }catch {
            print("데이터 저장 실패: \\(error.localizedDescription)")
        }
    }

    // 데이터 불러오기
    func loadCategories() {
        guard let context = context else { return }
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categoryArray = try context.fetch(fetchRequest)
            for category in categoryArray {
                print("Loaded Category: \(category.title ?? "")")
            }
            createAndSaveCategories()
        } catch {
            print("데이터 불러오기 실패: \\(error.localizedDescription)")
        }
    }
    
    //모든 데이터 삭제
    func dataRemove() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Category")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context?.execute(batchDeleteRequest)
            print("모든 데이터 삭제 성공")
            
            // 이후에 새로운 데이터를 추가하거나 초기 데이터 생성 메서드를 호출합니다.
        } catch {
            print("데이터 삭제 실패: \(error.localizedDescription)")
        }
    }
    
    func saveChangesToCoreData() {
        guard let context = context else {
            return // Core Data 컨텍스트를 가져올 수 없는 경우 종료
        }
        
        do {
            try context.save() // 변경 사항을 저장
            print("Core Data 변경 사항 저장 성공")
        } catch {
            print("Core Data 변경 사항 저장 실패: \(error.localizedDescription)")
            // 실패한 경우 오류 처리를 추가할 수 있습니다.
        }
    }
    
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [Category] {
        var categoryList: [Category] = []
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 정렬순서를 정해서 요청서에 넘겨주기
//            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
//            request.sortDescriptors = [dateOrder]
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [Category] {
                    categoryList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return categoryList
    }
    
    // MARK: - [Create]
    func saveToDoData(title: String, category: [Category], index: Int, completion: @escaping () -> Void) {
        // 임시저장소 있는지 확인
        if let context = context {
            // 임시저장소에 있는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let categoryData = NSManagedObject(entity: entity, insertInto: context) as? Category {
                    if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? Task {
                        
                        toDoData.id = UUID()
                        toDoData.createData = Date()
                        toDoData.isCompleted = true
                        toDoData.title = title
                        category[index].task?.append(toDoData)
                        
                        context.insert(categoryData)
                        context.insert(toDoData)
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
        completion()
    }
    
    // MARK: - [Delete]
    func deleteToDo(category: [Category], index: Int, indexPath: Int, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = category[index].task?[indexPath].createData else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [Category] {
                    
                    // 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
                    if let targetToDo = fetchedToDoList[index].task?[indexPath] {
                        context.delete(targetToDo)
                        
                        //appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
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
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update]
    func updateToDo(category: [Category], index: Int, indexPath: Int, newToDoData: Task, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = category[index].task?[indexPath].createData else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedToDoList = try context.fetch(request) as? [Category] {
                    // 배열의 첫번째
                    if var targetToDo = fetchedToDoList[index].task?[indexPath] {
                        
                        // MARK: - ToDoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo = newToDoData
                        
                        //appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
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
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
}
