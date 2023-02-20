//
//  Dictionary_DeApp.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.

import SwiftUI

@available(iOS 16.0, *)
@main
struct Worterbuch: App {

    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.getContext())
                .onAppear(){
                    dataController.preloadData()
                }
        }
    }
}

// MARK: I need to find out, if I need to do the same for CRUDL like fetching data from CoreData, If I need to use environmentObject
