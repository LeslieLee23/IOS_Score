//
//  HistoryDetailView.swift
//  Score1031
//
//  Created by Danting Li on 2/24/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData

struct HistoryDetailView: View {
    @EnvironmentObject private var nameAndScore: NameAndScore
    @EnvironmentObject private var userData: UserData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var record: Record
    
    
    var body: some View {
        NavigationView{
        VStack {
            VStack(alignment: .leading) {
                Text("\(self.record.score!) score to \(self.record.name!)")
                Text("\(self.record.entryTimeString!)")
            Spacer()
            }
            
            
            VStack {
                HStack {
                Text("Before:")
                    .font(.headline)
                    .fontWeight(.bold)
                }
                .padding(.leading)
                if self.record.name == "Destiny" {
                    HStack {
                    Spacer()
                    Text("\(Int(self.record.dnewscore!)! - Int(self.record.score!)!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.record.inewscore!)")
                        .font(.system(size: 25))
                    Spacer()
                    }
                } else {
                    HStack {
                    Spacer()
                    Text("\(self.record.dnewscore!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(Int(self.record.inewscore!)! - Int(self.record.score!)!)")
                        .font(.system(size: 25))
                    Spacer()
                }
                }
                
                HStack {
                    Spacer()
                    Text("\(self.userData.showEmoji ? userData.dName[1].name : userData.dName[0].name)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\(self.userData.showEmoji ? userData.iName[1].name : userData.iName[0].name)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                }
            }
            Spacer()
            VStack {
                Text("After:")
                    .font(.headline)
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Text("\(self.record.dnewscore!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.record.inewscore!)")
                        .font(.system(size: 25))
                    Spacer()
                }
                
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
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            }
        }
    }
}

//struct HistoryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            HistoryDetailView(record: <#Record#>)
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//        .environmentObject(NameAndScore())
//        .environmentObject(UserData())
//    }
//
//}

