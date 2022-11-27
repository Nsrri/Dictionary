
import Foundation
import SwiftUI

struct verbsInformations : Codable, Identifiable, Hashable  {
    let verb: String
    let tenses: [String]
    let pasts: [String]
    let explanation: String
    let examples: [String]
    let id: String
    
    init(verb: String, tenses: [String], pasts: [String], explanation: String, examples: [String], id: String) {
        self.verb = verb
        self.tenses = tenses
        self.pasts = pasts
        self.explanation = explanation
        self.examples = examples
        self.id = id
    }
}

