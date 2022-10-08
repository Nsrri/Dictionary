//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

struct MainView: View {
    var Wort = Bundle.main.decode([Module].self, from: "words.json")
    var body: some View {

        GeometryReader{ geometry in
            VStack{
                        ForEach(Wort) { x in
                            Text(x.article)
                        }
            }
            TabView{
                Home()
                    .tabItem {
                        Label("Home", systemImage: "house")
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

