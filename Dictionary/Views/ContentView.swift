//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var verb = Bundle.main.decode([verbsInformationsModel].self, from: "Verbs.json")
    @State var searchText: String = ""
    var body: some View {

        GeometryReader{ geometry in
            TabView{
                Home()
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
                AddVerb()
                    .tabItem {
                        Label("Add words", systemImage: "plus")
                    }
            }
  
        }
       
                    
        }

    }

