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


struct AddScoreView: View {
    @State var scoreAdded = ""
    @State var reason = ""
    @State var selectedName = 0
    @State var selectedNameString = ""
    @State var pointGrammar = "points"
    @State var showAddAlert = false
    var names = ["Destiny", "Isaac"]
    
    @EnvironmentObject var historyStore: HistoryStore
    
    @EnvironmentObject var nameAndScore: NameAndScore
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //CoreData section
    @Environment(\.managedObjectContext) var moc

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
              //  Spacer()
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
                        print("Dscore is \(self.nameAndScore.DestinyScore), IScore is \(self.nameAndScore.IsaacScore)")
                        /// Add history list function
                        self.historyStore.historys.append(
                            History(name: self.selectedNameString, addedScore: self.scoreAdded, reason: self.reason))
                        
//
//
//                        let record = Record(context: self.moc)
//                            record.id = UUID()
//                            record.name = self.selectedNameString
//                            record.addedScore = self.scoreAdded
//                            record.reason = self.reason
//                            try? self.moc.save()
                        
                        
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

