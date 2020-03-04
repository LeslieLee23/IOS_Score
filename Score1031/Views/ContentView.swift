//
//  ContentView.swift
//  Score1031
//
//  Created by Danting Li on 10/31/19.
//  Copyright © 2019 HULUCave. All rights reserved.
//
import Foundation
import SwiftUI
import Combine
import CoreData

struct ContentView: View {
    
    @EnvironmentObject private var nameAndScore: NameAndScore
    @EnvironmentObject private var userData: UserData
    @EnvironmentObject private var addEidtChoice: AddEidtChoice

    //CoreData var
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
    @State var names = [String]()
    
    var body: some View {
        NavigationView{
        VStack {

            VStack {
                //Toggle row
                VStack {
                    
                    HStack{
                        Spacer()
                         Text("Emoji Mode")
                            .font(.system(size:15))
                    }
                    .padding(.trailing, 35)
                    
                    HStack {
                        Spacer()
                        Toggle(isOn: $userData.showEmoji) {
                        Text("Emoji Mode")
                            
                    }.padding(.trailing, 35)
                     .labelsHidden()
                    }
                //Title row
                Spacer()
                Text("Credit Score")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(0.0)
                Spacer()
                //Score row
                HStack {
                    Spacer()
                    Text("\(self.nameAndScore.DestinyScore)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.nameAndScore.IsaacScore)")
                        .font(.system(size: 25))
                    Spacer()
                }
            //Name row
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\((self.userData.showEmoji ? self.nameAndScore.playerOneEmoji! : self.nameAndScore.playerOneName!) ?? "")")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\((self.userData.showEmoji ? self.nameAndScore.playerTwoEmoji! : self.nameAndScore.playerTwoName!) ?? "")")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                }
                Spacer()
                Spacer()
            }
            //Add Score Button row
            VStack {
                NavigationLink (destination: AddScoreView(names: names)) {
                    Text("Add Score!")
                        .fontWeight(.semibold)
                }
                .frame(width: 89, height: 8, alignment: .center)
            .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("isaacblue"), Color("destinygreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(13)
            .simultaneousGesture(TapGesture().onEnded {
                
                self.names  = ["\(self.nameAndScore.playerOneName ?? "P1")","\(self.nameAndScore.playerTwoName ?? "P2")"]
                print("\(self.names[1])")
            })

                }
            Spacer()
            Spacer()
            //Edit Score Button row
           VStack {
            NavigationLink (destination: AddScoreView(names: names)) {
                   Text("Edit Score!")
                   .fontWeight(.semibold)
               }
                .frame(width: 89, height: 8, alignment: .center)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("destinygreen"), Color("isaacblue")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(13)
            .simultaneousGesture(TapGesture().onEnded {
                print("Hey Hey Yo Yo")
                self.addEidtChoice.addViewSelected = false
                self.names  = ["\(self.nameAndScore.playerOneName ?? "P1")","\(self.nameAndScore.playerTwoName ?? "P2")"]
            })

               }
                VStack {
            
                Spacer()
                Spacer()
            // View History row
                    
                HStack {
                    VStack {
                        NavigationLink (destination: HistoryView())
                        {
                            Text("View History")
                                .fontWeight(.light)
                                .font(.system(size:15))
                        }
                        .padding()
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        NavigationLink (destination: ChangePlayerView())
                        {
                            Text("Change Players")
                                .fontWeight(.light)
                                .font(.system(size:15))
                        }
                        .padding()
                        Spacer()
                    }
                }
                    
                    Spacer()
                    HStack {
                        
                        Button(action: {
                            self.nameAndScore.IsaacScore = 0
                            self.nameAndScore.DestinyScore = 0
                        //Delete all Core Data rows
                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
                        fetchRequest.includesPropertyValues = false
                        
                        do {
                            let items = try self.managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
                            for item in items {
                                self.managedObjectContext.delete(item)
                            }
                            try self.managedObjectContext.save()
                        } catch let error {
                            print("Detele all data in Record error :", error)
                        }
                            
                        })
                        {
                            Text("Start Over")
                        }
                    }
                }
            }
            }} }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(NameAndScore())
        .environmentObject(UserData())
    }
}

}
