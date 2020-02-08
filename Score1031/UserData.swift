//
//  UserData.swift
//  Score1031
//
//  Created by Danting Li on 11/18/19.
//  Copyright © 2019 HULUCave. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showEmoji = false
    @Published var dName = "Destiny"
    @Published var iName = "Isaac"
}

