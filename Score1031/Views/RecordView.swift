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
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                Text(entryTime)
                    .font(.caption)
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
