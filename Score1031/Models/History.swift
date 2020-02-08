//
//  History.swift
//  Score1031
//
//  Created by Danting Li on 1/9/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Foundation

struct History: Identifiable {
    let id = UUID()
    var name: String
    var addedScore: String
    var reason: String
}
