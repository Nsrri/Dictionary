
import Foundation
import SwiftUI

struct WordsInformations : Codable, Identifiable  {
    let word, article, plural, explanation: String
    let examples: [String]
    let id: UUID
}

