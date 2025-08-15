//
//  RishiBurger+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Naveen Kumar on 15/08/25.
//
//

import Foundation
import CoreData


extension RishiBurger {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RishiBurger> {
        return NSFetchRequest<RishiBurger>(entityName: "RishiBurger")
    }

    @NSManaged public var id: String?
    @NSManaged public var product_name: String?
    @NSManaged public var modifier: String?

}

extension RishiBurger : Identifiable {

}
