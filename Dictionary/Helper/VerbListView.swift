//
//  VerbListView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct VerbListView: View {
    
    var verbs: [VerbViewModel]
    @StateObject var vm: VerbListViewModel = VerbListViewModel()
    @State var isFavoriteView: Bool
    var onDelete: ((IndexSet) -> Void)? = nil
    
    func deleteItem(offsets: IndexSet) {
        onDelete?(offsets)
    }
                
    var body: some View {
        List{
            ForEach(verbs) { verb in
                VerbCellView(verb: verb)
            }.onDelete(perform: deleteItem(offsets:))
               
            }
            .background(Color("Lemon"))
                .scrollContentBackground(.hidden)
                .listStyle(.automatic)
                
    }
}

