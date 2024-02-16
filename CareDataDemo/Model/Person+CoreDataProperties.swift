//
//  Person+CoreDataProperties.swift
//  CareDataDemo
//
//  Created by Fernando on 16/02/24.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var family: Family?

}

extension Person : Identifiable {

}
