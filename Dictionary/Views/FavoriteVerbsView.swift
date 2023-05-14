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
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    if vm.verbs.isEmpty {
                        Spacer()
                        ErrorViewMessage()
                        Spacer()
                    }
                    else {
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
                    }
                    
                }.task {
                    await  vm.populateFavoriteVerbs()
                }
                .frame(width: geometry.size.width)
                .background(Color("Lemon"))
            }
        }
        
        
    }
}

