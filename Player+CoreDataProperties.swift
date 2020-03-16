//
//  Player+CoreDataProperties.swift
//  Score1031
//
//  Created by Danting Li on 3/16/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var playerID: String?
    @NSManaged public var playerOneEmoji: String?
    @NSManaged public var playerOneName: String?
    @NSManaged public var playerOneScore: Int16
    @NSManaged public var playerTwoEmoji: String?
    @NSManaged public var playerTwoName: String?
    @NSManaged public var playerTwoScore: Int16
    @NSManaged public var record: NSSet?

}

// MARK: Generated accessors for record
extension Player {

    @objc(addRecordObject:)
    @NSManaged public func addToRecord(_ value: Record)

    @objc(removeRecordObject:)
    @NSManaged public func removeFromRecord(_ value: Record)

    @objc(addRecord:)
    @NSManaged public func addToRecord(_ values: NSSet)

    @objc(removeRecord:)
    @NSManaged public func removeFromRecord(_ values: NSSet)

}
