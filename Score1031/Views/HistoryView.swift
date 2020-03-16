//
//  HistoryView.swift
//  Score1031
//
//  Created by Danting Li on 1/19/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData

struct HistoryView: View {
    @State var modalIsPresented = false
    //CoreData var
     @Environment(\.managedObjectContext) var managedObjectContext
     @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     @EnvironmentObject private var userData: UserData

     var body: some View {

         NavigationView {
             List {
                 ForEach(self.records) {record in
                     if record.playerID == self.userData.playerID {
                     NavigationLink(
                         destination: HistoryDetailView(record: record)) {
                             RecordView(name: record.name!, score: record.score!, reason: record.reason!, entryTime: record.entryTimeString!, playerID: record.playerID)
                     }
                     }

                 }
                 .onDelete { indexSet in
                     for index in indexSet {
                        self.managedObjectContext.delete(self.records[index])
                        try? self.managedObjectContext.save()
                    }}
                .navigationBarTitle(Text("Score Change History"))
            }
        }
    }
    
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
}
