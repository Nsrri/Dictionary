//
//  Favorites.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesItems = Favorites()
    var body: some View {
        List(favoritesItems.favoriteItems, id: \.self) {
            item in
            Text(item.verb)
        }
        
    }
}

//struct Favorites_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
