//
//  Add.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//


import SwiftUI

struct AddVerb: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) var dismiss
    
    
    @State var verb: String = ""
    @State var conjunctions: [String] = []
    @State var conjunction: String = ""
    @State var tenses: [String] = []
    @State var tense: String = ""
    @State var explanation: String = ""
    @State var examples: [String] = []
    @State var example: String = ""
    
    
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
                Section{
                    Button {
                        let newVerb = Verbs(context: moc)
                        newVerb.id = UUID()
                        newVerb.verb = verb
                        newVerb.conjunctions = conjunctions
                        newVerb.tenses = tenses
                        newVerb.explanation = explanation
                        newVerb.examples = examples
                        
                        try? moc.save()
                        dismiss()
                    } label: {
                        Text("Hinzufügen")
                    }
                }

                
            }.navigationTitle("Neues Verb")
        }
    }
}
