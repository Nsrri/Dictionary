
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

struct Verb : Codable {
    var _id: String
    var verb: String
    var tenses: [String]
    var conjunctions: [String]
    var explanation: String
    var examples: [String]
    var favorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case _id
        case verb
        case tenses
        case conjunctions
        case explanation
        case examples
        case  favorite
      }
}
