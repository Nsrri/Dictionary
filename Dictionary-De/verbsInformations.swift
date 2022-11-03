
import Foundation
import SwiftUI

struct verbsInformations : Codable, Identifiable  {
    let verb: String
    let tenses: [String]
    let pasts: [String]
    let explanation: String
    let examples: [String]
    let id: UUID
    
    enum CodingKeys: String, CodingKey {
        case verb = "Verb"
        case id = "ID"
        case tenses = "Tenses"
        case pasts = "Pasts"
        case explanation = "Explanation"
        case examples = "Examples"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        verb = try values.decode(String.self, forKey: .verb)
        id = try values.decode(UUID.self, forKey: .id)
        tenses = try values.decode([String].self, forKey: .tenses)
        pasts = try values.decode([String].self, forKey: .pasts)
        explanation = try values.decode(String.self, forKey: .explanation)
        examples = try values.decode([String].self, forKey: .examples)
        
    }
    func encode(to encoder: Encoder) throws {
        
    }
}

