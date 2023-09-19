//
//  Category+CoreDataProperties.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/19.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var task: [Task]?

}

extension Category : Identifiable {

}
