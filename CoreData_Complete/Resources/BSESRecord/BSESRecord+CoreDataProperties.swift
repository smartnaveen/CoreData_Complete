//
//  BSESRecord+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Naveen Kumar on 15/08/25.
//
//

import Foundation
import CoreData


extension BSESRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BSESRecord> {
        return NSFetchRequest<BSESRecord>(entityName: "BSESRecord")
    }

    @NSManaged public var village_name: String?
    @NSManaged public var id: String?

}

extension BSESRecord : Identifiable {

}
