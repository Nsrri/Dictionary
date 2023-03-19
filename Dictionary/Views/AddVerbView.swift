//
//  Add.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//


import SwiftUI

@available(iOS 16.0, *)
struct AddVerbView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = VerbListViewModel()
    
    @State var showEror: Bool = false
    @State var verb: String = ""
    @State var conjunctions: [String] = []
    @State var conjunction: String = ""
    @State var tenses: [String] = []
    @State var tense: String = ""
    @State var explanation: String = ""
    @State var examples: [String] = []
    @State var example: String = ""
    @State var isFavorite: Bool = false
    @State var category: String = ""
    
    
    func checkRepetetiveVerbs(verb: String) -> Bool {
        if vm.verbs.contains(where: {$0.verb == verb.lowercased() }) {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                Form {
                    Section(header: Text("Das Verb")){
                        TextField("Trage Hier das Verb ein", text: $verb)
                    }
                    Section(header: Text("Die Konjuntion")){
                        HStack{
                            TextField("Trage das konjugierte Verb ein", text: $conjunction)
                            Button {
                                conjunctions.append(conjunction)
                                conjunction = ""
                                withAnimation{
                                    UIApplication.shared.dismissKeyboard()
                                }
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                    Section(header: Text("Die Zeiten")){
                        HStack{
                            TextField("Trage die Zeit des Verbes ein", text: $tense)
                            Button {
                                tenses.append(tense)
                                tense = ""
                                withAnimation{
                                    UIApplication.shared.dismissKeyboard()
                                }
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                    Section(header: Text("Die Erklärung")){
                        TextField("Die Erklärung", text: $explanation)
                    }
                    
                    Section(header: Text("Die Beispiels")){
                        HStack{
                            TextField("Trage das Beispiel des Verbes ein", text: $example)
                            Button {
                                examples.append(example)
                                example = ""
                                withAnimation{
                                    UIApplication.shared.dismissKeyboard()
                                }
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Die Kategorie")){
                        TextField("Die Kategorie", text: $category )
                    }
                    
                    
                    HStack{
                        Spacer()
                        Button {
                            @State var newVerb = VerbViewModel(verb: Verb(_id: "", verb: verb, tenses: tenses, conjunctions: conjunctions, explanation: explanation, examples: examples, favorite: false, category: category))
                            if checkRepetetiveVerbs(verb: newVerb.verb) {
                                showEror = true
                                verb = ""
                                explanation = ""
                            } else {
                                Task.init(operation: {
                                    await vm.addNewVerb(verbVM:newVerb)
                                })
                                verb = ""
                                conjunction = ""
                                tense = ""
                                explanation = ""
                                example = ""
                                category = ""
                                dismiss()
                            }
                            
                        } label: {
                            Text("Hinzufügen")
                        } .disabled(verb.isEmpty)
                            .alert("Das verb gibt schon", isPresented: $showEror) {
                                Button("OK", role: .cancel) { }
                                
                            }
                        Spacer()
                    }
                    
                    
                }.scrollContentBackground(.hidden)
                    .navigationTitle("Neues Verb")
                    .background(Color("Lemon"))
                    .task {
                        await vm.populateVerbs()
                    }
            }
        }
        
    }
}
