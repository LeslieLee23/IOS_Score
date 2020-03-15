
import Foundation
import SwiftUI
import Combine

final class NameAndScore: ObservableObject {
    @Published var PlayerOneScore: Int = UserDefaults.standard.integer(forKey: "DScore") {
        didSet {
            UserDefaults.standard.set(self.PlayerOneScore, forKey: "DScore")
        }
    }
    @Published var PlayerTwoScore: Int = UserDefaults.standard.integer(forKey: "IScore") {
        didSet {
            UserDefaults.standard.set(self.PlayerTwoScore, forKey: "IScore")
        }
    }
    @Published var playerOneName = UserDefaults.standard.string(forKey: "OneName") {
          didSet {
              UserDefaults.standard.set(self.playerOneName, forKey: "OneName")
          }
      }

      @Published var playerTwoName = UserDefaults.standard.string(forKey: "TwoName") {
          didSet {
              UserDefaults.standard.set(self.playerTwoName, forKey: "TwoName")
          }
      }

      @Published var playerOneEmoji = UserDefaults.standard.string(forKey: "OneEmoji") {
          didSet {
              UserDefaults.standard.set(self.playerOneEmoji, forKey: "OneEmoji")
          }
      }

      @Published var playerTwoEmoji = UserDefaults.standard.string(forKey: "TwoEmoji") {
          didSet {
              UserDefaults.standard.set(self.playerTwoEmoji, forKey: "TwoEmoji")
          }
      }
}
