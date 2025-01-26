//
//  User+CoreDataProperties.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userId: UUID?
    @NSManaged public var userName: String?

}

extension User: Identifiable {

}
