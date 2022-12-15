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
    let Data = Bundle.main.decode([verbsInformationsModel].self, from:"Verbs.json")
    @Environment(\.managedObjectContext) private var moc
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
               
        }
    }
}
