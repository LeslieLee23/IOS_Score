//
//  NameAndScore.swift
//  Score1031
//
//  Created by Danting Li on 1/19/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

final class NameAndScore: ObservableObject {
    @Published var DestinyScore: Int = UserDefaults.standard.integer(forKey: "DScore") {
        didSet {
            UserDefaults.standard.set(self.DestinyScore, forKey: "DScore")
        }
    }
    @Published var IsaacScore: Int = UserDefaults.standard.integer(forKey: "IScore") {
        didSet {
            UserDefaults.standard.set(self.IsaacScore, forKey: "IScore")
        }
    }

    
}
