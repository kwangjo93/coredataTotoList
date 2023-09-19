//
//  Task+CoreDataProperties.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var createData: Date?
    @NSManaged public var modifyDate: Date?
    @NSManaged public var isCompleted: Bool
    
    var createDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.createData else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
    
    var modifyDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.modifyDate else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }

}

extension Task : Identifiable {

}
