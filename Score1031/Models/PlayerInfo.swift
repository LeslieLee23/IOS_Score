import Foundation
import SwiftUI
import Combine

class PlayerInfo: ObservableObject {
//    @Published var PlayerOneName = "Destiny"
//    @Published var PlayerTwoName = "Isaac"
//    @Published var PlayerOneEmoji = "🍗"
//    @Published var PlayerTwoEmoji = "🥑"
    

    @Published var PlayerOneName: String = UserDefaults.standard.string(forKey: "OneName") {
        didSet {
            UserDefaults.standard.set(self.PlayerOneName, forKey: "OneName")
        }
    }

    @Published var PlayerTwoName: String = UserDefaults.standard.string(forKey: "TwoName") {
        didSet {
            UserDefaults.standard.set(self.PlayerTwoName, forKey: "TwoName")
        }
    }

    @Published var PlayerOneEmoji: String = UserDefaults.standard.string(forKey: "OneEmoji") {
        didSet {
            UserDefaults.standard.set(self.PlayerOneEmoji, forKey: "OneEmoji")
        }
    }

    @Published var PlayerTwoEmoji: String = UserDefaults.standard.string(forKey: "TwoEmoji") {
        didSet {
            UserDefaults.standard.set(self.PlayerTwoEmoji, forKey: "TwoEmoji")
        }
    }
    
}
