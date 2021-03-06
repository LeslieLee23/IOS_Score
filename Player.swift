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
import UIKit


public class Player:NSManagedObject, Identifiable {
    @NSManaged public var playerID: String
    @NSManaged public var playerOneEmoji: String?
    @NSManaged public var playerOneName: String?
    @NSManaged public var playerOneScore: Int16
    @NSManaged public var playerTwoEmoji: String?
    @NSManaged public var playerTwoName: String?
    @NSManaged public var playerTwoScore: Int16
    @NSManaged public var record: NSSet?
    
    
    
    public var recordArray: [Record] {
        let set = record as? Set<Record> ?? []

        return set.sorted {
            $0.playerID < $1.playerID
        }
    }
}

extension Player {
        static func getAllRecords() -> NSFetchRequest<Player> {
        let request:NSFetchRequest<Player> = Player.fetchRequest() as! NSFetchRequest<Player>
        let sortDescriptor = NSSortDescriptor(key: "playerID", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
        static func getProductCount() -> Int {
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let count = try! managedObjectContext.count(for: fetchRequest)
        return count
        }
}
