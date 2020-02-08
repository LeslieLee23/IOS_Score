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
    
    @Published var dName = [(name: "Destiny", size: 25),(name: "🍗", size:45)]
    @Published var iName = [(name: "Isaac", size: 25),(name: "🥑", size:35)]
}
