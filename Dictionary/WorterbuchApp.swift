//
//  Dictionary_DeApp.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI

@main
struct Worterbuch: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
               
        }
    }
}
