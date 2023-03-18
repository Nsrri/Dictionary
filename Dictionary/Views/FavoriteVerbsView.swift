//
//  Favorites.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct FavoriteVerbsView: View {

    @StateObject var vm = VerbListViewModel()
 
    var body: some View {
        NavigationView {
            VStack {
                VerbListView(verbs: vm.verbs, isFavoriteView: true)
          
            } .task {
                await vm.populateFavoriteVerbs()
            }

        }
        
        
    }
}

