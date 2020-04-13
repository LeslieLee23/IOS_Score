//
//  History.swift
//  Score1031
//
//  Created by Danting Li on 1/9/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI

struct RecordView: View {
     var name: String = ""
     var score: String = ""
     var reason: String = ""
     var entryTime: String = ""
     var playerID: String = ""
     var body: some View {

         HStack(){
             VStack(alignment: .leading){
            Text(playerID)
            .font(.headline)
             Text(name)
                 .font(.headline)
             Text(score)
                .font(.headline)
                .foregroundColor(score.first == "-" ? .red : .green)
                }
            .frame(width:90,height: 45, alignment: .leading)
           // .border(Color.purple)
            
           
            VStack(alignment: .leading){
                Text(reason)
                    .font(.system(size: 13))
                    .multilineTextAlignment(.leading)
                Text(entryTime)
                    .font(.system(size: 13))
            }
            .frame(width:210, height: 45, alignment: .leading)
          //  .border(Color.purple)
        
        }
    }
}

struct RecordView_Preview: PreviewProvider
{
    static var previews: some View {
        RecordView()
    }
}
