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
    @State var editScoreIsVisible: Bool = false
    @EnvironmentObject private var userData: UserData
    //CoreData var
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>
    
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
                    Text("\(self.userData.showEmoji ? userData.dName[1].name : userData.dName[0].name)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\(self.userData.showEmoji ? userData.iName[1].name : userData.iName[0].name)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                }
                Spacer()
                Spacer()
            }
            //Add Score Button row
            VStack {
                NavigationLink (destination: AddScoreView()) {
                    Text("Add Score!")
                        .fontWeight(.semibold)
                }
                .frame(width: 89, height: 8, alignment: .center)
            .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("isaacblue"), Color("destinygreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(13)
                }
            Spacer()
            Spacer()
            //Edit Score Button row
           VStack {
               NavigationLink (destination: EditScoreView()) {
                   Text("Edit Score!")
                   .fontWeight(.semibold)
               }
                .frame(width: 89, height: 8, alignment: .center)
                .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("destinygreen"), Color("isaacblue")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(13)

               }
                VStack {
            
                Spacer()
            // View History row
                    HStack {
                        NavigationLink (destination: HistoryView()) {
                            Text("View History")
                                .fontWeight(.light)
                                .font(.system(size:15))
                        }
                        .padding()
                        Spacer()
                    }
                    Spacer()
//                    HStack {
                        
//                        Button(action: {
//                            let fetchRequest = NSFetchRequest<Record>(entityName: "Score1031")
//
//                            do {
//                                let records = try managedObjectContext.execute(fetchRequest) as! [NSManagedObject]
//                                for record in records {
//                                    self.managedObjectContext.delete(record)
//                                }
//                                try self.managedObjectContext.save()
//
//                            } catch {
//                                print("Error")
//                            }
//
//                        })
//                        {
//                            Text("Clear Data")
//                        }
//                    }
                }
            }
            }} }
    
    func updateData () {
        
    }


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
