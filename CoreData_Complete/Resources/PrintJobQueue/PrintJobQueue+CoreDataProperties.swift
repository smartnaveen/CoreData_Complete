//
//  PrintJobQueue+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Naveen Kumar on 15/08/25.
//
//

import Foundation
import CoreData


extension PrintJobQueue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrintJobQueue> {
        return NSFetchRequest<PrintJobQueue>(entityName: "PrintJobQueue")
    }

    @NSManaged public var id: String?
    @NSManaged public var printer_name: String?
    @NSManaged public var offline_id: String?
    @NSManaged public var kitchen_id: String?

}

extension PrintJobQueue : Identifiable {

}
