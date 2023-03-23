//
//  Favorites.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct FavoriteVerbsView: View {
    
    @ObservedObject var vm = VerbListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VerbListView(verbs: vm.verbs, isFavoriteView: true, onDelete:  { IndexSet in
                    for index in IndexSet {
                        var verb = vm.verbs[index]
                        if verb.favorite {
                            verb.favorite = false
                            Task {
                                await vm.populateFavoriteStatus(verbVM:verb)
                            }
                        }
                    }
                    vm.verbs.remove(atOffsets: IndexSet)
                })
                
            }.task {
               await  vm.populateFavoriteVerbs()
            }
            
        }
        
        
    }
}

