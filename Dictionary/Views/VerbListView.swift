//
//  VerbListView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct VerbListView: View {
    
    let verbs: [VerbViewModel]
                
    var body: some View {
        List(verbs) { verb in
            VerbCellView(verb: verb)
        }.background(Color("Lemon"))
            .scrollContentBackground(.hidden)
            .listStyle(.automatic)
        
    }
}

@available(iOS 16.0, *)
struct VerbListView_Previews: PreviewProvider {
    static var previews: some View {
        VerbListView(verbs: [])
    }
}
