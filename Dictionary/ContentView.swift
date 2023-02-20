//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

@available(iOS 16.0, *)
struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Khaki")
    }
    
    var body: some View {
        GeometryReader{ geometry in
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
                    }
                FavoriteVerbsView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                AddVerbView()
                    .tabItem {
                        Label("Add words", systemImage: "plus")
                    }
            }
            
        }
        
        
    }
    
}

