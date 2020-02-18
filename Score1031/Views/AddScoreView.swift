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
    @State var scoreEdited = ""
    @State var reason = ""
    @State var selectedName = 0
    @State var selectedNameString = ""
    @State var pointGrammar = "points"
    @State var showAlert = false
    var names = ["Destiny", "Isaac"]
    
    @EnvironmentObject var nameAndScore: NameAndScore
    @EnvironmentObject var addEidtChoice: AddEidtChoice
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //CoreData var
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
    
    
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
                if addEidtChoice.addViewSelected == true {
                TextField("Score to add", text: $scoreEdited)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                } else {
                 TextField("New Score", text: $scoreEdited)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                }
                
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
                        self.showAlert = true
                        
                    if Int(self.scoreEdited) == nil {
                        }
                        
                    if self.addEidtChoice.addViewSelected == true {
                        if self.selectedName == 0 {
                            self.nameAndScore.DestinyScore += Int(self.scoreEdited)!
                            self.selectedNameString = "Destiny"
                        }
                        else if self.selectedName == 1 {
                            self.nameAndScore.IsaacScore += Int(self.scoreEdited)!
                            self.selectedNameString = "Isaac"
                        }
                    } else {
                        if self.selectedName == 0 {
                            self.nameAndScore.DestinyScore = Int(self.scoreEdited)!
                            self.selectedNameString = "Destiny"
                        }
                        else if self.selectedName == 1 {
                            self.nameAndScore.IsaacScore = Int(self.scoreEdited)!
 
                            self.selectedNameString = "Isaac"
                        }
                    }
                    if Int(self.scoreEdited) == 1 {
                        self.pointGrammar = "point"
                    }
                        
                        ///CoreData save
                        let record = Record(context: self.managedObjectContext)
                            record.name = self.selectedNameString
                            record.score = self.scoreEdited
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
                        if addEidtChoice.addViewSelected == true {
                        Text("Add")
                        }
                        else {
                        Text("Confirm")
                        }
                    }
                    .disabled(scoreEdited.isEmpty)
                    .disabled(Double(scoreEdited)  == nil)
                    
                    .alert(isPresented: $showAlert) { () ->
                        Alert in
                        if self.addEidtChoice.addViewSelected == true {
                        return Alert(title: Text("Score added!"), message: Text("You added \(self.scoreEdited) \(self.pointGrammar) to \(self.selectedNameString)"), dismissButton: Alert.Button.default(Text("Ok"))
                            
                            // this part was learned from the RayRay class
                           {self.presentationMode.wrappedValue.dismiss() }
                        )
                        } else {
                            return Alert(title: Text("Score edited!"), message: Text("You edited \(self.selectedNameString)'s score to \(self.scoreEdited)"), dismissButton: Alert.Button.default(Text("Ok"))
                            {self.presentationMode.wrappedValue.dismiss() }
                            )
                        }
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

