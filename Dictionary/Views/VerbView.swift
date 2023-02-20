//
//  VerbView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 18.02.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct VerbView: View {
    var verbVM: VerbViewModel
    init(verbVM: VerbViewModel) {
        self.verbVM = verbVM
    }
    var body: some View {
        NavigationView {
            List{
                Section("Das Verb"){
                    Text(verbVM.verb)
                        .listRowBackground(Color("Lemon"))
                }
                Section("Zeiten"){
                    ForEach(verbVM.conjunctions, id: \.self){ conjunction in
                        Text("*\(conjunction)")
                            .listRowBackground(Color("Lemon"))
                    }
                }
                Section("Die vergangenheit Formen"){
                    ForEach(verbVM.tenses, id: \.self){ tense in
                        Text(tense)
                            .listRowBackground(Color("Lemon"))
                    }
                }
                Section("Die Erzählung"){
                    Text(verbVM.explanation).background(Color.gray)
                        .listRowBackground(Color("Lemon"))
                }
                Section("Die Beispiels"){
                    ForEach(verbVM.examples, id: \.self){ example in
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


