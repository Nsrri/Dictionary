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
    var pasts: String
    var explanation: String
    var examples: [String]
    public init (verb: String,
                 tenses: [String],
                 pasts: String,
                 explanation: String,
                 examples: [String]){
        self.verb = verb
        self.tenses = tenses
        self.pasts = pasts
        self.explanation = explanation
        self.examples = examples
        
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text(verb)
            Divider()
            HStack(alignment: .center, spacing: 2){
                ForEach(tenses, id: \.self){ tense in
                    Text("*\(tense)")
                }
            }
            Divider()
            Text(pasts)
            Divider()
            Text(explanation).background(Color.gray)
            Divider()
            HStack(alignment: .center, spacing: 2){
                ForEach(examples, id: \.self){ example in
                    Text("-\(example)" + "\n")
                }
            }

            
        }
    }
}
//
//struct DynamicVerbsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicVerbsView()
//    }
//}
