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
            let verbs = try await NetworkHandler().getAllVerbs()
            DispatchQueue.main.async {
                self.verbs = verbs.map(VerbViewModel.init)
            }
             
        } catch {
            print(error)
            
        }
    }
    
    func populateFavoriteVerbs() async {
        
        do {
            let verbs = try await NetworkHandler().getAllFavoriteVerbs()
            DispatchQueue.main.async {
                self.verbs = verbs.map(VerbViewModel.init)
            }
             
        } catch {
            print(error)
            
        }
    }
    
    func populateFavoriteStatus(verbVM: VerbViewModel) async {
        let verb = Verb(_id: verbVM.id, verb: verbVM.verb, tenses: verbVM.tenses, conjunctions: verbVM.conjunctions, explanation: verbVM.explanation, examples: verbVM.examples, favorite: verbVM.favorite, category: verbVM.category)
        
        do {

            let returnedVerb = try await NetworkHandler().UpdateFavoriteSatatus(verb: verb)
            if let index = verbs.firstIndex(where: { $0.id == returnedVerb._id }) {
                verbs[index] = VerbViewModel(verb: returnedVerb)
        
            }
        } catch {
            print(error)
        }
    }
    
    func addNewVerb(verbVM: VerbViewModel) async {
        let verb = Verb(_id: verbVM.id, verb: verbVM.verb, tenses: verbVM.tenses, conjunctions: verbVM.conjunctions, explanation: verbVM.explanation, examples: verbVM.examples, favorite: verbVM.favorite, category: verbVM.category)
        
        do {
               try await NetworkHandler().AddNewVerb(verb: verb)
        } catch {
            print(error)
        }
    }
    
    func deletVerb(id: String) async {
        do {
            try await NetworkHandler().DeleteVerbById(id: id )
        } catch {
            print(error)
        }
    }
    
}

struct VerbViewModel: Identifiable, Codable {
    
     var verbModel: Verb
    
    init(verb: Verb) {
        self.verbModel = verb
    }
    
    var id: String {
        get{
            verbModel._id
        }
    }
    
    var verb: String {
        get {
            verbModel.verb
        }
        set {
            verbModel.verb = newValue
        }
    }
    
    var tenses: [String] {
        get {
            verbModel.tenses
        }
        set {
            verbModel.tenses = newValue
        }
       
    }
    
    var conjunctions: [String] {
        get {
            verbModel.conjunctions
        }
        set {
            verbModel.conjunctions = newValue
        }
       
    }
    
    var explanation: String {
        get {
            verbModel.explanation
        }
        set {
            verbModel.explanation = newValue
        }
        
    }
    
    var examples: [String] {
        get {
            verbModel.examples
        }
        set {
            verbModel.examples = newValue
        }
       
    }
    var favorite: Bool {
        get {
            verbModel.favorite
        }
        set {
            verbModel.favorite = newValue
        }
    }
    var category: String {
        get {
            verbModel.category
        }
        set {
            verbModel.category = newValue
        }
    }
}
