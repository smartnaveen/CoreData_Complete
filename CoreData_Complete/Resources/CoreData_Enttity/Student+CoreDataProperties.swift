//
//  Student+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Mr. Naveen Kumar on 13/04/21.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}

extension Student : Identifiable {

}
