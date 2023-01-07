
import Foundation
import SwiftUI

struct verbsInformationsModel : Codable, Identifiable, Hashable  {
    let verb: String
    let conjunctions: [String]
    let tenses: [String]
    let explanation: String
    let examples: [String]
    let id: UUID
}

