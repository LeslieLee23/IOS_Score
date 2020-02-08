//
//  HistoryStore.swift
//  Score1031
//
//  Created by Danting Li on 1/19/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Combine

class HistoryStore: ObservableObject {
  @Published var historys = [
    History(name: "Destiny", addedScore: "1",reason: "shuffle borad"),
    History(name: "Isaac", addedScore: "1", reason: "Game night"),
    History(name: "Destiny",addedScore: "1", reason: "Guess actress's age in that Korean movie where there is a little girl")
    ]
}
/*
@Published var DestinyScore: Int = UserDefaults.standard.integer(forKey: "DScore") {
    didSet {
        UserDefaults.standard.set(self.DestinyScore, forKey: "DScore")
    }
}
*/
