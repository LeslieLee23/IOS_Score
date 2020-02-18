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
    
    
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading){
            Text(name)
              .font(.headline)
            Text(reason)
              .font(.caption)
            
            }
            Spacer()
            VStack(alignment: .trailing){
                Text(score)
                    .font(.headline)
                Text(entryTime)
                    .font(.caption)
                Text("")
            }
            Spacer()
        }
    }
}

struct RecordView_Preview: PreviewProvider
{
    static var previews: some View {
        RecordView()
    }
}
