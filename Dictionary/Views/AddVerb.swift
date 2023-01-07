//
//  Add.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//


import SwiftUI

struct AddVerb: View {
    
    @ObservedObject var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) var dismiss
   
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
    
    func checkRepetetiveVerbs(verb: String) -> Bool {
        var result: Bool = false
        for existedVerb in verbs{
            result =  existedVerb.verb == verb
        }
       return result
    }
    
    var body: some View {
        NavigationView{
            Form{
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
           
                    HStack{
                        Spacer()
                        Button {
                            if dataController.itemExists(verb){
                                showEror = true
                                
                            } else{
                                let newVerb = Verbs(context: moc)
                                newVerb.id = UUID()
                                newVerb.verb = verb
                                newVerb.conjunctions = conjunctions
                                newVerb.tenses = tenses
                                newVerb.explanation = explanation
                                newVerb.examples = examples
                                newVerb.favorite = isFavorite
                                dataController.saveContext()
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
                        
                
            }.navigationTitle("Neues Verb")
            
        }
    }
}