//
//  HistoryView.swift
//  Score1031
//
//  Created by Danting Li on 1/19/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyStore: HistoryStore
    @State var modalIsPresented = false

    
    var body: some View {

        
        
        
            List(historyStore.historys) {history in
                VStack{
                HStack {
                Text(history.name)
                Text(history.addedScore)
                Text(history.reason)
                }
                }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
