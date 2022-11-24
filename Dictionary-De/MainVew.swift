//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

struct MainView: View {
    var Wort = Bundle.main.decode([verbsInformations].self, from: "words.json")
    @State var searchText: String = ""
    var body: some View {

        GeometryReader{ geometry in
            VStack{
                        ForEach(Wort) { x in
                            Text(x.verb)
                        }
            }
            TabView{
                Home()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
        
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
                    }
                Favorites()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                Add()
                    .tabItem {
                        Label("Add words", systemImage: "plus")
                    }
            }
  
        }
       
                    
        }

    }

