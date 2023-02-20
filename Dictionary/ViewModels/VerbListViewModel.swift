//
//  VerbListViewModel.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 09.02.23.
//

import Foundation
import SwiftUI


final class VerbListViewModel: ObservableObject {
    
    @Published var verbs: [VerbViewModel] = []
    
    func populateVerbs() async {
        
        do {
            let verbs = try await WebService().getAllVerbs(url: Constants.Urls.allVerbs)
            DispatchQueue.main.async {
                self.verbs = verbs.map(VerbViewModel.init)
            }
             
        } catch {
            print(error)
            
        }
    }
    
    func populateFavoriteVerbs() async {
        
        do {
            let verbs = try await WebService().getAllVerbs(url: Constants.Urls.allFavoriteVerbs)
            DispatchQueue.main.async {
                self.verbs = verbs.map(VerbViewModel.init)
            }
             
        } catch {
            print(error)
            
        }
    }
}

struct VerbViewModel: Identifiable {
    
    
    private let verbModel: Verb
    
    init(verb: Verb) {
        self.verbModel = verb
    }
    
    var id: String {
        verbModel._id
    }
    
    var verb: String {
        verbModel.verb
    }
    
    var tenses: [String] {
        verbModel.tenses
    }
    
    var conjunctions: [String] {
        verbModel.conjunctions
    }
    
    var explanation: String {
        verbModel.explanation
    }
    
    var examples: [String] {
        verbModel.examples
    }
    var favorite: Bool {
        verbModel.favorite 
    }
    
    
}
