          //
//  SelectPlayerView.swift
//  Score1031
//
//  Created by Danting Li on 3/16/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI


struct SelectPlayersView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Player.getAllRecords()) var players: FetchedResults<Player>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject private var nameAndScore: NameAndScore
    @EnvironmentObject private var userData: UserData
    
    var playerID: String = ""
    var playerOneScore: String = ""
    var playerTwoScore: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(players, id: \.self) { player in
//                    NavigationLink(
//                        destination: ContentView().navigationBarBackButtonHidden(true)) {
                    HStack{
                    VStack{
                        SelectView(playerID: player.playerID, playerOneName: player.playerOneName ?? "NA", playerTwoName: player.playerTwoName ?? "NA", playerOneScore: String(player.playerOneScore), playerTwoScore: String(player.playerTwoScore), playerOneEmoji: player.playerOneEmoji ?? "", playerTwoEmoji: player.playerTwoEmoji ?? "")
//                        }
                        }
                    VStack{
                        Button(action: {
                            self.userData.playerID = player.playerID
                            self.nameAndScore.playerOneName = player.playerOneName
                            self.nameAndScore.playerTwoName = player.playerTwoName
                            self.nameAndScore.playerOneEmoji = player.playerOneEmoji
                            self.nameAndScore.playerTwoEmoji = player.playerTwoEmoji
                            self.nameAndScore.PlayerOneScore = Int(player.playerOneScore)
                            self.nameAndScore.PlayerTwoScore = Int(player.playerTwoScore)
                            self.presentationMode.wrappedValue.dismiss()
                        })
                        {
                            Text("Go")
                                .foregroundColor(.green)
                        }
                    }
                    }
                    }
                }
            }
        }
    }

struct SelectPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPlayersView()
    }
}


