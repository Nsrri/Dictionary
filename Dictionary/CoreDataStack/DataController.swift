//
//  DataController.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 31.10.22.
//
import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "newVerbs")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}


