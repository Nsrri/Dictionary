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
                  (200...290).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidRequest
            }
    
            let verbs = try? JSONDecoder().decode([Verb].self, from: data)
            return verbs ?? []
    
        }
    
    func getAllFavoriteVerbs() async throws -> [Verb] {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/favorite")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        let verbs = try? JSONDecoder().decode([Verb].self, from: data)
        return verbs ?? []
    }
    
    func UpdateFavoriteSatatus(verb: Verb) async throws -> Verb {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/updateFavorite")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: "\(verb._id)")]
        
        guard let finalURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "PATCH"
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(verb)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        catch {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
        let decoder = JSONDecoder()
        let verb = try decoder.decode(Verb.self, from: data)
        return verb
    }
    
    func AddNewVerb(verb: Verb) async throws  {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/AddVerb")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let encoder = JSONEncoder()
            let newVerb = try encoder.encode(verb)
            request.httpBody = newVerb
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(String(data: newVerb, encoding: .utf8)!)
            
        } catch {
            throw error
        }
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
        
    }
    
    func DeleteVerbById(id: String) async throws {
        let url = urlProvider.UserEndpoint.appendingPathComponent("delete")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: id)]
        
        guard let finalUrl = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
    }
    
    // Network Handling of Questions
    
    func getAllQuestions() async throws -> [Question] {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/allQuestions")
        let (data, response) = try await URLSession.shared.data(from: url)
        
       guard let httpResponse = response as? HTTPURLResponse,
        (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
        
        let questions = try? JSONDecoder().decode([Question].self, from: data)
        return questions ?? []
    }
    

    
    func UpdateUserAnswer(question: Question) async throws -> Question {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/updateUserAnswer")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: "\(question._id)")]
        
        guard let finalURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "PATCH"
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(question)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        catch {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
        let decoder = JSONDecoder()
        let question = try decoder.decode(Question.self, from: data)
        return question
   
    }
    
    func UpdatePoint(question: Question) async throws -> Question {
        let url = urlProvider.UserEndpoint.appendingPathComponent("/updatePoint")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: "\(question._id)")]
        
        guard let finalURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "PATCH"
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(question)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        catch {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...290).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidRequest
        }
        let decoder = JSONDecoder()
        let question = try decoder.decode(Question.self, from: data)
        return question
    }
}
