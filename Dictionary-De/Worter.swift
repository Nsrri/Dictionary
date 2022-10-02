
import Foundation
import SwiftUI

struct Wörter : Codable, Identifiable, Equatable {
    var wort : String
    var id : UUID
    var artikel : String
    var pluralFrom : String
    var erklärung : String
}
