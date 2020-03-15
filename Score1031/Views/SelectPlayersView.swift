//
//  SelectPlayersView.swift
//  Score1031
//
//  Created by Danting Li on 3/9/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI


struct SelectPlayersView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Player.getAllRecords()) var players: FetchedResults<Player>
    
    var body: some View {
        VStack {
            List {
                ForEach(players, id: \.self) { player in
                    Text(player.playerID)
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
