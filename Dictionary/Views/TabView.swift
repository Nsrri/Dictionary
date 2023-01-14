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
    @State var searchText: String = ""
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Khaki")
    }
    
    var body: some View {
        GeometryReader{ geometry in
            TabView{
                Home()
                    .tabItem {
                        Label("Home", systemImage: "house")
//                            .foregroundColor(Color("Celadon"))
                    }
        
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
//                            .foregroundColor(Color("Celadon"))
                    }
                FavoriteVerbsView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
//                            .foregroundColor(Color("Celadon"))
                    }
                AddVerb()
                    .tabItem {
                        Label("Add words", systemImage: "plus")
//                            .foregroundColor(Color("Celadon"))
                    }
            }
         
        }
       
                    
        }

    }

