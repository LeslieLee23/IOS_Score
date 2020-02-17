//
//  AddScoreView.swift
//  Score1031
//
//  Created by Danting Li on 11/5/19.
//  Copyright © 2019 HULUCave. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData


struct AddScoreView: View {
    @State var scoreAdded = ""
    @State var reason = ""
    @State var selectedName = 0
    @State var selectedNameString = ""
    @State var pointGrammar = "points"
    @State var showAddAlert = false
    var names = ["Destiny", "Isaac"]
    
    @EnvironmentObject var nameAndScore: NameAndScore
    
    //CoreData var
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Text("Go back")
        }
        }
    }
    
    var body: some View {
        
        VStack {
            
            VStack {
                Picker(selection: $selectedName, label:
                    Text("Pick a name")
                    , content: {
                        ForEach(0 ..< names.count) {
                            Text(self.names[$0])
                        }
                        
                }).pickerStyle(SegmentedPickerStyle())
                    .padding(.trailing, 35)
                    .padding(.leading, 35)

                TextField("Score to add", text: $scoreAdded)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                
                TextField("What for?", text: $reason)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        print("Name is \(self.selectedName)")
                        self.presentationMode.wrappedValue.dismiss() 
                    }) {
                        Text("Cancel")
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        self.showAddAlert = true
                        if Int(self.scoreAdded) == nil {
                        }
                        else if self.selectedName == 0 {
                            self.nameAndScore.DestinyScore += Int(self.scoreAdded)!
                            self.selectedNameString = "Destiny"
                        }
                        else if self.selectedName == 1 {
                            self.nameAndScore.IsaacScore += Int(self.scoreAdded)!
                            self.selectedNameString = "Isaac"
                        }
                        if Int(self.scoreAdded) == 1 {
                            self.pointGrammar = "point"
                        }
                        
                        ///CoreData save
                        let record = Record(context: self.managedObjectContext)
                            record.name = self.selectedNameString
                            record.score = self.scoreAdded
                            record.reason = self.reason

                        let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss"
                            record.entryTimeString = dateFormatter.string(from: Date())
                            record.entryTime = Date()
                        
                        print("*&^*^NOW THE TIME IS \(String(describing: record.entryTime))")
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch{
                            print(error)
                        }
                    
                    }) {
                        Text("Add")
                    }
                    .disabled(scoreAdded.isEmpty)
                    .disabled(Double(scoreAdded)  == nil)
                    .alert(isPresented: $showAddAlert) { () ->
                        Alert in
                        return Alert(title: Text("Score added!"), message: Text("You added \(self.scoreAdded) \(self.pointGrammar) to \(self.selectedNameString)"), dismissButton: Alert.Button.default(Text("Ok"))
                            // this part was learned from the RayRay class
                    {self.presentationMode.wrappedValue.dismiss() }
                        )
                    }
                    Spacer()
                }
                Spacer()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: btnBack)
                Spacer()
            }
        }
        
    }
}


struct AddScoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddScoreView()
    }
}

