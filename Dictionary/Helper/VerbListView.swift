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
    @StateObject var vm: VerbListViewModel = VerbListViewModel()
    @State var isFavoriteView: Bool
    
    func deleteItem(offsets: IndexSet) {
        for offset in offsets {
            var verb = verbs[offset]
            if isFavoriteView {
                if verb.favorite {
                    verb.favorite = false
                    Task {
                        await vm.populateFavoriteStatus(verbVM:verb)
                    }
                    
                }
            } else {
                Task{
                    await vm.deletVerb(id:verb.id)
                }
            }
            
        }
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

@available(iOS 16.0, *)
struct VerbListView_Previews: PreviewProvider {
    static var previews: some View {
        VerbListView(verbs: [], isFavoriteView: false)
    }
}
