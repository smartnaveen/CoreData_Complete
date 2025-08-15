//
//  DelhiJalBoard+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Naveen Kumar on 15/08/25.
//
//

import Foundation
import CoreData


extension DelhiJalBoard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DelhiJalBoard> {
        return NSFetchRequest<DelhiJalBoard>(entityName: "DelhiJalBoard")
    }

    @NSManaged public var id: String?
    @NSManaged public var empolyee_name: String?

}

extension DelhiJalBoard : Identifiable {

}
