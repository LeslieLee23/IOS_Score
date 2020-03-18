//
//  SelectView.swift
//  Score1031
//
//  Created by Danting Li on 3/16/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI

struct SelectView: View {
    var playerID: String = ""
    var playerOneName: String = ""
    var playerTwoName: String = ""
    var playerOneScore: String = ""
    var playerTwoScore: String = ""

    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(playerID)
                }
            .frame(width:80,height: 45, alignment: .leading)
                
            VStack(alignment: .leading){
                Text(playerOneName)
                    .font(.caption)
                Text(String(playerOneScore))
            }
            .frame(width:100, height: 45, alignment: .leading)
            VStack(alignment: .leading){
                Text(playerTwoName)
                    .font(.caption)
                Text(String(playerTwoScore))
            }
            .frame(width:100, height: 45, alignment: .leading)

        
            
       }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
