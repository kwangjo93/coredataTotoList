//
//  Task+CoreDataProperties.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var createData: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var mainImage: Data?
    @NSManaged public var modifyDate: Date?
    @NSManaged public var title: String?

}

extension Task : Identifiable {

}
