//
//  KazbarRestuarant+CoreDataProperties.swift
//  CoreData_Complete
//
//  Created by Naveen Kumar on 15/08/25.
//
//

import Foundation
import CoreData


extension KazbarRestuarant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KazbarRestuarant> {
        return NSFetchRequest<KazbarRestuarant>(entityName: "KazbarRestuarant")
    }

    @NSManaged public var id: String?
    @NSManaged public var location: String?
    @NSManaged public var price: String?
    @NSManaged public var is_printed: String?

}

extension KazbarRestuarant : Identifiable {

}
