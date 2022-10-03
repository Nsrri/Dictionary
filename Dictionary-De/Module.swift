
import Foundation
import SwiftUI

struct Module : Codable, Identifiable {
    var word : String
    var id : UUID
    var article : String
    var plural : String
    var explanation : String
}
