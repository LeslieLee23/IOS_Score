//
//  UserData.swift
//  Score1031
//
//  Created by Danting Li on 11/19/19.
//  Copyright © 2019 HULUCave. All rights reserved.
//

import SwiftUI
import Combine

class UserData: ObservableObject {

    @Published var showEmoji: Bool = UserDefaults.standard.bool(forKey: "showEmoji") {
        didSet {
            UserDefaults.standard.set(self.showEmoji, forKey: "showEmoji")
        }
    }
    
    @Published var playerID = UserDefaults.standard.string(forKey: "playerID") {
        didSet {
            UserDefaults.standard.set(self.playerID, forKey: "playerID")
        }
    }
    
    @Published var maxPlayerID = UserDefaults.standard.integer(forKey: "maxPlayerID") {
        didSet {
            UserDefaults.standard.set(self.maxPlayerID, forKey: "maxPlayerID")
        }
    }
}
