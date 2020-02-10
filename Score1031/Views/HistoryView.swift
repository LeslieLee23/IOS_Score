//
//  HistoryView.swift
//  Score1031
//
//  Created by Danting Li on 1/19/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    @State var modalIsPresented = false
    //CoreData var
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
   // @State private var record = ""

    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.records) {record in
                    RecordView(name: record.name!, score: record.score!, reason: record.reason!)
                }

            }
        }
    .navigationBarTitle(Text("Score Change History"))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
