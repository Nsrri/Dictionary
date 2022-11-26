//
//  DataController.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 31.10.22.
//

import CoreData
import Foundation

// create  CoreData stack as a class singelton

class DataController: NSObject,ObservableObject {
    
    override init() {
        super.init()
    }
    
    //Returns the current Persistent Container for CoreData
    class func getContext () -> NSManagedObjectContext {
        return DataController.persistentContainer.viewContext
    }
    
    
    static var persistentContainer: NSPersistentContainer = {
        //The container that holds both data model entities
        let container = NSPersistentContainer(name: "Worterbuch")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                
                //TODO: - Add Error Handling for Core Data
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            
        })
        return container
    }()
    
    // Mark: - to save the data
    class func saveContext() {
        let context = self.getContext()
        if context.hasChanges {
            do {
                try context.save()
                print("Save Data to context")
            } catch {
                let nserror =  error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    // GET / Fetch / Requests
    class func getAllVerbs() -> Array<Verbs> {
        let all = NSFetchRequest<Verbs>(entityName: "Verbs")
        var allVerbs = [Verbs]()
        
        do {
            let fetched = try DataController.getContext().fetch(all)
            allVerbs = fetched
        } catch {
            let nserror = error as NSError
            print(nserror.description)
        }
        return allVerbs
    }
    
    // Get show by UUID
    class func getVerbWith(uuid: String) -> Verbs? {
        let requested = NSFetchRequest<Verbs>(entityName: "Verbs")
        requested.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        do {
            let fetched = try DataController.getContext().fetch(requested)
            
            if (fetched.count > 1) {
                
            } else{
                return fetched.first
            }
        }
        catch {
            let nserror = error as NSError
            print(nserror.description)
        }
        return nil
    }
    
    class func deleteVerb(with uuid: String) -> Bool {
        let success: Bool = true
        
        let requested = NSFetchRequest<Verbs>(entityName: "Verbs")
        requested.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        
        do {
            let fetched = try DataController.getContext().fetch(requested)
            for verb in fetched {
                DataController.getContext().delete(verb)
            }
            return success
        } catch {
            let nserror = error as NSError
            //TODO: Handle Error
            print(nserror.description)
        }
        
        return !success
    }
    
    
    // Delete ALL SHOWS From CoreData
    class func deleteAllVerbs() {
        do {
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Verbs")
            let deleteALL = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            try DataController.getContext().execute(deleteALL)
            DataController.saveContext()
        } catch {
            print ("There is an error in deleting records")
        }
    }
}



