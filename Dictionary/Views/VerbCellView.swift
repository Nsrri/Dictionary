//
//  VerbCellView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct VerbCellView: View {
    
    let verb: VerbViewModel
    
    var body: some View {
        NavigationLink(destination: VerbView(verbVM: verb)) {
            Label(
                title: { Text(verb.verb) },
                icon: {  }
            )
        }
        
    }
}


