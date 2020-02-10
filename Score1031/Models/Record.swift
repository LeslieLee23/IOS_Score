//
//  Record.swift
//  Score1031
//
//  Created by Danting Li on 2/9/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Foundation
import CoreData

public class Record:NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var score: String?
    @NSManaged public var reason: String?
}

extension Record {
    static func getAllRecords() -> NSFetchRequest<Record> {
        let request:NSFetchRequest<Record> = Record.fetchRequest() as! NSFetchRequest<Record>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

