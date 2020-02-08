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

struct EditScoreView: View {
    @State var newScore = ""
    @State var selectedName = 0
    @State var selectedNameString = ""

    @State var showAddAlert = false
    var names = ["Destiny", "Isaac"]
    
    @EnvironmentObject var nameAndScore: NameAndScore
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("ic_back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
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
                
                })
                .pickerStyle(SegmentedPickerStyle())
                TextField("New score", text: $newScore)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        print("Name is \(self.selectedName)")
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                    
                    Button(action: {
                        self.showAddAlert = true
                        if Int(self.newScore) == nil {
                        }
                        else if self.selectedName == 0 {
                            self.nameAndScore.DestinyScore = Int(self.newScore)!
                        //    self.destinyAddAlert = true
                            self.selectedNameString = "Destiny"
                        }
                        else if self.selectedName == 1 {
                            self.nameAndScore.IsaacScore = Int(self.newScore)!
                        //    self.isaacAddAlert = true
                            self.selectedNameString = "Isaac"
                        }
                        print("Dscore is \(self.nameAndScore.DestinyScore), IScore is \(self.nameAndScore.IsaacScore)")
                        
                    }) {
                        Text("Confirm")
                    }
                    .alert(isPresented: $showAddAlert) { () ->
                                   Alert in
                        return Alert(title: Text("Score added!"), message: Text("You edited \(self.selectedNameString)'s score to \(self.newScore)"), dismissButton: Alert.Button.default(Text("Ok")))
                                   }
                    Spacer()
                }
                Spacer()
//                VStack {
//                    NavigationLink(destination: ContentView()) {
//                        Text("Back Home")
//                    }
//                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
                Spacer()
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
        .padding(.top, 7)
        
    }
}
    

struct EditScoreView_Previews: PreviewProvider {
    static var previews: some View {
        EditScoreView()
    }
}

