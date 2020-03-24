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

    @State var names = [String]()
    @State var oldscore = [String]()
    
    var body: some View {
        NavigationView{
        VStack {

            VStack {
                //Toggle row
                VStack {
                    
                    HStack{
                        NavigationLink (destination: SelectPlayersView())
                        {
                            Text("Change Players")
                                .fontWeight(.light)
                                .font(.system(size:15))
                                .padding()
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                             
                            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Player")
                            fetchRequest.predicate = NSPredicate(format: "playerID == %@", self.userData.playerID!)
                            do
                            {
                                let player = try self.managedObjectContext.fetch(fetchRequest)
                                
                                    let objectUpdate = player[0] as! NSManagedObject
                                    objectUpdate.setValue(self.nameAndScore.PlayerOneScore, forKey: "playerOneScore")
                                    objectUpdate.setValue(self.nameAndScore.PlayerTwoScore, forKey: "playerTwoScore")
                                do{
                                    try self.managedObjectContext.save()
                                    print(objectUpdate.value(forKey: "playerID") ?? "no playerID")
                                    print(objectUpdate.value(forKey: "playerOneEmoji") ?? "no playerOneEmoji")
                                    print(objectUpdate.value(forKey: "playerOneName") ?? "no playerOneName")
                                    print(objectUpdate.value(forKey: "playerOneScore") ?? "no playerOneScore")
                                    print(objectUpdate.value(forKey: "playerTwoEmoji") ?? "no playerTwoEmoji")
                                    print(objectUpdate.value(forKey: "playerTwoName") ?? "no playerTwoName")
                                    print(objectUpdate.value(forKey: "playerTwoScore") ?? "no playerTwoScore")
                                }
                                catch
                                {
                                    print(error)
                                }
                            }
                            catch
                            {
                                print(error)
                            }
                        })
                        
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
                    Text("\(self.nameAndScore.PlayerOneScore)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.nameAndScore.PlayerTwoScore)")
                        .font(.system(size: 25))
                    Spacer()
                }
            //Name row
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\((self.userData.showEmoji ? self.nameAndScore.playerOneEmoji! : self.nameAndScore.playerOneName!) )")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\((self.userData.showEmoji ? self.nameAndScore.playerTwoEmoji! : self.nameAndScore.playerTwoName!) )")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                }
                Spacer()
                Spacer()
            }
            //Add Score Button row
            VStack {
                NavigationLink (destination: AddScoreView(names: names, oldscore: oldscore)) {
                    Text("Add Score!")
                        .fontWeight(.semibold)
                }
                .frame(width: 89, height: 8, alignment: .center)
            .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("isaacblue"), Color("destinygreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(13)
            .simultaneousGesture(TapGesture().onEnded {
                self.addEidtChoice.addViewSelected = true
                self.names  = ["\(self.nameAndScore.playerOneEmoji!) \( self.nameAndScore.playerOneName!)","\( self.nameAndScore.playerTwoEmoji!) \( self.nameAndScore.playerTwoName!)"]
                self.oldscore = ["\(self.nameAndScore.PlayerOneScore)", "\(self.nameAndScore.PlayerTwoScore)"]
            })

                }
            Spacer()
            Spacer()
            //Edit Score Button row
           VStack {
            NavigationLink (destination: AddScoreView(names: names, oldscore: oldscore)) {
                   Text("Edit Score!")
                   .fontWeight(.semibold)
               }
                .frame(width: 89, height: 8, alignment: .center)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("destinygreen"), Color("isaacblue")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(13)
            .simultaneousGesture(TapGesture().onEnded {
                self.addEidtChoice.addViewSelected = false
                self.names  = ["\(self.nameAndScore.playerOneEmoji!) \( self.nameAndScore.playerOneName!)","\( self.nameAndScore.playerTwoEmoji!) \( self.nameAndScore.playerTwoName!)"]
                self.oldscore = ["\(self.nameAndScore.PlayerOneScore)", "\(self.nameAndScore.PlayerTwoScore)"]
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
                            Text("Add Players")
                                .fontWeight(.light)
                                .font(.system(size:15))
                        }
                        .padding()
                            
//Set player record with updated scores
                        .simultaneousGesture(TapGesture().onEnded {
                            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Player")
                            fetchRequest.predicate = NSPredicate(format: "playerID == %@", self.userData.playerID!)
                            do
                            {
                                let player = try self.managedObjectContext.fetch(fetchRequest)
                                let objectUpdate = player[0] as! NSManagedObject
                                objectUpdate.setValue(self.nameAndScore.PlayerOneScore, forKey: "playerOneScore")
                                objectUpdate.setValue(self.nameAndScore.PlayerTwoScore, forKey: "playerTwoScore")
                                do{
                                    try self.managedObjectContext.save()
                                    print(objectUpdate.value(forKey: "playerID") ?? "no playerID")
                                    print(objectUpdate.value(forKey: "playerOneEmoji") ?? "no playerOneEmoji")
                                    print(objectUpdate.value(forKey: "playerOneName") ?? "no playerOneName")
                                    print(objectUpdate.value(forKey: "playerOneScore") ?? "no playerOneScore")
                                    print(objectUpdate.value(forKey: "playerTwoEmoji") ?? "no playerTwoEmoji")
                                    print(objectUpdate.value(forKey: "playerTwoName") ?? "no playerTwoName")
                                    print(objectUpdate.value(forKey: "playerTwoScore") ?? "no playerTwoScore")
                                }
                                catch
                                {
                                    print(error)
                                }
                            }
                            catch
                            {
                                print(error)
                            }
                        })
                        
                        Spacer()
                    }
                }
                    
                    Spacer()
                    HStack {
                        
                        Button(action: {
                            self.nameAndScore.PlayerTwoScore = 0
                            self.nameAndScore.PlayerOneScore = 0
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
