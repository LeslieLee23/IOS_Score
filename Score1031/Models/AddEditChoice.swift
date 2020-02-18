import Foundation
import SwiftUI
import Combine

class AddEidtChoice: ObservableObject {
    @Published var addViewSelected : Bool = true
    @Published var dName = [(name: "Destiny", size: 25),(name: "🍗", size:45)]
}
