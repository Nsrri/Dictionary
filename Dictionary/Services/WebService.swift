//
//  APIInteractions.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 05.02.23.
//

import Foundation
import SwiftUI
import Combine

enum NetworkError: Error {
    case badURL
    case invalidRequest
}

class WebService: ObservableObject {
    
    func getAllVerbs(url: URL) async throws -> [Verb]{
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
       
        print(response)
        let verbs = try? JSONDecoder().decode([Verb].self, from: data)
        return verbs ?? []
    }
}
