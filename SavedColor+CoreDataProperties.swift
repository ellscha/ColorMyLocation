//
//  SavedColor+CoreDataProperties.swift
//  
//
//  Created by Elli Scharlin on 8/14/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SavedColor {

    @NSManaged var address: String?
    @NSManaged var longitude: NSNumber?
    @NSManaged var green: NSNumber?
    @NSManaged var latitude: NSNumber?
    @NSManaged var red: NSNumber?
    @NSManaged var blue: NSNumber?
    @NSManaged var altitude: NSNumber?
    @NSManaged var createdAt: NSDate?

}
