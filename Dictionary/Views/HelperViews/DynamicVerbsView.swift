//
//  DynamicVerbsView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 13.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct DynamicVerbsView: View {
    
    var verb: String
    var conjunctions: [String]
    var tenses: [String]
    var explanation: String
    var examples: [String]
    var id: UUID = UUID()

  
    public init (verb: String,
                 conjunctions: [String],
                 tenses: [String],
                 explanation: String,
                 examples: [String],
                 id: UUID = UUID()
    )
    {
        self.verb = verb
        self.conjunctions = conjunctions
        self.tenses = tenses
        self.explanation = explanation
        self.examples = examples
        self.id = id
    }
    var body: some View {
        GeometryReader{ geometry in
            NavigationView {
                    List{
                        Section("Das Verb"){
                            Text(verb)
                                .listRowBackground(Color("Lemon"))
                        }
                        Section("Zeiten"){
                            ForEach(conjunctions, id: \.self){ conjunction in
                                Text("*\(conjunction)")
                                    .listRowBackground(Color("Lemon"))
                            }
                        }
                        Section("Die vergangenheit Formen"){
                            ForEach(tenses, id: \.self){ tense in
                                Text(tense)
                                    .listRowBackground(Color("Lemon"))
                            }
                        }
                        Section("Die Erzählung"){
                            Text(explanation).background(Color.gray)
                                .listRowBackground(Color("Lemon"))
                        }
                        Section("Die Beispiels"){
                            ForEach(examples, id: \.self){ example in
                                Text("-\(example)" + "\n")
                                    .listRowBackground(Color("Lemon"))
                            }
                        }
                        
                    }
                    .background(Color("Lemon"))
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                    
                    
            }
        }
        
    }
}


  
struct verbInfos {
    var verb: String
    var conjunctions: [String]
    var tenses: [String]
    var explanation: String
    var examples: [String]
    var uuid = UUID()
    @State var isFavorite: Bool
    
}
