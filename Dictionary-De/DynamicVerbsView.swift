//
//  DynamicVerbsView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 13.10.22.
//

import SwiftUI

struct DynamicVerbsView: View {
    var verb: String
    var tenses: [String]
    var pasts: [String]
    var explanation: String
    var examples: [String]
    public init (verb: String,
                 tenses: [String],
                 pasts: [String],
                 explanation: String,
                 examples: [String]){
        self.verb = verb
        self.tenses = tenses
        self.pasts = pasts
        self.explanation = explanation
        self.examples = examples
        
    }
    var body: some View {
        
        List{
            
            Section("Das Verb"){
                Text(verb)
            }
            Section("Zeiten"){
                ForEach(tenses, id: \.self){ tense in
                    Text("*\(tense)")
                }
            }
            Section("Die vergangenheit Formen"){
                ForEach(pasts, id: \.self){ past in
                    Text(past)
                }
            }
            Section("Die Erzählung"){
                Text(explanation).background(Color.gray)
            }
            Section("Die Beispiels"){
                ForEach(examples, id: \.self){ example in
                    Text("-\(example)" + "\n")
                }
            }
            
        }.listStyle(.plain)
    }
}

//
//struct DynamicVerbsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicVerbsView()
//    }
//}
