
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
