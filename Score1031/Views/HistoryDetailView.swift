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
                HStack {
                VStack {
                 Text("\(self.record.entryTimeString!)")
                 if record.addEdit == true {
                     Text("\(self.record.score!) score for \(self.record.name!)")
                 } else {
                     Text("\(self.record.name!)'s score were edited")
                 }
                }
            }
                HStack {
                    Spacer()
                }
             }
            .padding(.leading)
            


             VStack {
                 HStack {
                 if record.addEdit == true {
                 Text("Before Score Add:")
                     .font(.headline)
                     .fontWeight(.bold)
                 } else {
                 Text("Before Score Edit:")
                     .font(.headline)
                     .fontWeight(.bold)
                     }
                 }
                 .padding(.leading)
                 if self.record.name == self.nameAndScore.playerOneName {
                    HStack {
                    Spacer()
                    Text("\(Int(self.record.ponescore!)! - Int(self.record.score!)!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.record.ptwoscore!)")
                        .font(.system(size: 25))
                    Spacer()
                    }
                } else {
                    HStack {
                    Spacer()
                    Text("\(self.record.ponescore!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(Int(self.record.ptwoscore!)! - Int(self.record.score!)!)")
                        .font(.system(size: 25))
                    Spacer()
                }
                }
                
                HStack {
                    Spacer()
                    Text("\(self.userData.showEmoji ? self.nameAndScore.playerOneEmoji! : self.nameAndScore.playerOneName!)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\(self.userData.showEmoji ? self.nameAndScore.playerTwoEmoji! : self.nameAndScore.playerTwoName!)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                }
             }
             Spacer()
             VStack {
                 HStack {
                 if record.addEdit == true {
                 Text("After Score Add:")
                     .font(.headline)
                     .fontWeight(.bold)
                 } else {
                 Text("After Score Edit:")
                     .font(.headline)
                     .fontWeight(.bold)
                     }
                 }
                 HStack {
                     Spacer()
                     Text("\(self.record.ponescore!)")
                        .font(.system(size: 25))
                    Spacer()
                    Text("\(self.record.ptwoscore!)")
                        .font(.system(size: 25))
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("\(self.userData.showEmoji ? self.nameAndScore.playerOneEmoji! : self.nameAndScore.playerOneName!)")
                    .font(.system(size: self.userData.showEmoji ? 45 : 25))
                    Spacer()
                    Text("\(self.userData.showEmoji ? self.nameAndScore.playerTwoEmoji! : self.nameAndScore.playerTwoName!)")
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

