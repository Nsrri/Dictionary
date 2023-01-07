//
//  Dictionary_DeApp.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI

@main
struct Worterbuch: App {
    @StateObject var dataController = DataController()
    init(){
        dataController.preloadData()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.getContext())
        }
    }
}

