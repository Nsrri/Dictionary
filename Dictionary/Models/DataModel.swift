
import Foundation
import SwiftUI

//struct verbsInformationsModel : Codable, Identifiable, Hashable  {
//    let verb: String
//    let conjunctions: [String]
//    let tenses: [String]
//    let explanation: String
//    let examples: [String]
//    let id: UUID
//}



struct Verb : Codable {
    var _id: String
    var verb: String
    var tenses: [String]
    var conjunctions: [String]
    var explanation: String
    var examples: [String]
    var favorite: Bool
    var category: String

    enum CodingKeys: String, CodingKey {
        case _id
        case verb
        case tenses
        case conjunctions
        case explanation
        case examples
        case favorite
        case category
      }
}




struct Question : Codable {
    var _id: String
    var question: String
    var options: [String]
    var answer: String
    var userAnswer: String
    var point: Int
    
    
    enum CodingKeys: String, CodingKey {
        case _id
        case question
        case options
        case answer
        case userAnswer
        case point
      }

}
