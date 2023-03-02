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
    case noData
}

class NetworkHandler: ObservableObject {
    
    let urlProvider: URLProvider
    
    init(urlProvider: URLProvider = EndpointURLProvider()) {
        self.urlProvider = urlProvider
    }
    
    func getAllVerbs() async throws -> [Verb] {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/search")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
       
        let verbs = try? JSONDecoder().decode([Verb].self, from: data)
        return verbs ?? []

    }
    
    func getAllFavoriteVerbs() async throws -> [Verb] {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/:favorite")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
       
        let verbs = try? JSONDecoder().decode([Verb].self, from: data)
        return verbs ?? []
    }
    
    func updateVerbById(verb: Verb) async throws -> Verb {
        let url = urlProvider.UserEndpoint.appendingPathComponent("update")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: "\(verb._id)"), URLQueryItem(name: "favorite", value: "\(verb.favorite)")]
        
        guard let finalURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "PATCH"
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(verb)
            request.httpBody = data
        }
        catch {
            throw error
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }

        do {
            let decoder = JSONDecoder()
            let verb = try decoder.decode(Verb.self, from: data)
            return verb
        } catch {
            throw error
        }
    }


}
