//
//  CreationTime.swift
//  Score1031
//
//  Created by Danting Li on 4/4/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Record>
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { record
            in
            VStack(alignment: .leading){
            Text("Players created at \(record.entryTimeString ?? "No Date Avaliable")")
            .font(.caption)
            }
           // .frame(width:300,height: 45, alignment: .leading)
            
        }
    }
    init(playerID: String) {
        fetchRequest = FetchRequest<Record>(entity: Record.entity(), sortDescriptors: [], predicate: NSPredicate(format: "score == %@ AND playerID == %@", "NA", playerID))
        }
    }


