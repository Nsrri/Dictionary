//
//  Favorites.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 27.11.22.
//

import SwiftUI

class Favorites: ObservableObject {
    private var favorites: Set<String>
    let defaults = UserDefaults.standard
    @Published var favoriteItems: [verbsInformations] = []
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let favoriteData = try? decoder.decode(Set<String>.self, from: data)
            self.favorites = favoriteData ?? []
        } else {
            self.favorites = []
        }
    }
    
    func getFavoriteIds() -> Set<String> {
        return self.favorites
    }
    
    func isEmpty() -> Bool {
        favorites.count < 1
    }
    
    func contains(_ favorite: verbsInformations) -> Bool {
        favorites.contains(favorite.id)
    }
    
    func add(_ favorite: verbsInformations) {
        objectWillChange.send()
        favorites.insert(favorite.id)
        favoriteItems.append(favorite)
        save()
    }
    
    func remove(_ favorite: verbsInformations) {
        objectWillChange.send()
        favorites.remove(favorite.id)
        favoriteItems.removeAll()
            
            save()
        }
        
        func save() {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(favorites) {
                defaults.set(encoded, forKey: "Favorites")
            }
        }
    }

