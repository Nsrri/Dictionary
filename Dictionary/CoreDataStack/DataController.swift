//
//  DataController.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 31.10.22.
//
import Foundation
import CoreData


class DataController: ObservableObject {
    let LocalJsonData = Bundle.main.decode([verbsInformationsModel].self, from:"Verbs.json")
    init(){}
    
//Step1: get the access to the data model via persistentContainer
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "newVerbs")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
        //ToDO: Add error Handling for CoreData
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
       func preloadData(){
           let deafaults = UserDefaults.standard
           if deafaults.bool(forKey: "First Launch") == true{
               print("second+")
               deafaults.set(true, forKey: "First Launch")
           } else{
               getContext().automaticallyMergesChangesFromParent = true
               for verb in LocalJsonData {
                   let newVerb = Verbs(context: getContext())
                   newVerb.id = UUID()
                   newVerb.verb = verb.verb
                   newVerb.conjunctions = verb.conjunctions
                   newVerb.tenses = verb.tenses
                   newVerb.explanation = verb.explanation
                   newVerb.examples = verb.examples
                   newVerb.favorite = false
                   self.saveContext()
                   
               }
               deafaults.set(true, forKey: "First Launch")
           }
       }
    
//Step2: get access to the managedObjectContext
    func getContext() -> NSManagedObjectContext{
        return DataController.persistentContainer.viewContext
    
    }
    
     func itemExists(_ item: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Verbs")
        fetchRequest.predicate = NSPredicate(format: "verb == %@", item)
        return ((try? getContext().count(for: fetchRequest)) ?? 0) > 0
    }
    
    
    func saveContext(){
   
        let context = self.getContext()
        if context.hasChanges{
            do{
                try context.save()
                print("Data saved to Context")
                context.automaticallyMergesChangesFromParent = true

            }catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
  
    func getAllVerbs() -> Array<Verbs> {
        let all = NSFetchRequest<Verbs>(entityName: "Verbs")
        var allVerbs = [Verbs]()
        
        do{
            let fetched = try getContext().fetch(all)
            allVerbs = fetched
            getContext().automaticallyMergesChangesFromParent = true
        } catch {
            let nserror = error as NSError
          //TODO: Handle Error
            print(nserror.description)
        }
        return allVerbs
    }
    
    func getVerbsWith(favorite: Bool) -> Array<Verbs>{
   
        let all = NSFetchRequest<Verbs>(entityName: "Verbs")
        all.predicate = NSPredicate(format: "favorite == %@", NSNumber(value: true))
        var allFavorites = [Verbs]()
        
        do{
            let fetched = try getContext().fetch(all)
            allFavorites = fetched
            getContext().automaticallyMergesChangesFromParent = true
            
            if (fetched.count > 1) {
                //TODO: handle duplicate records
            } else{
                return allFavorites
            }
        } catch{
            let nserror = error as NSError
            //TODO: Handle error
            print(nserror.description)
        }

        return allFavorites
    }
    
    func deleteVerb(uuid: UUID) {
  
        
        let requested = NSFetchRequest<Verbs>(entityName: "Verbs")
        requested.predicate = NSPredicate(format: "id == %@", uuid.uuidString)
        
        do{
            let fetched = try getContext().fetch(requested)
            for verb in fetched{
                getContext().delete(verb)
            }
            getContext().automaticallyMergesChangesFromParent = true
        }catch {
            let nserror = error as NSError
            //TODO
            print(nserror.description)
            
        }
    }
    
    func deleteAllVerbs() {

        do{
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Verbs")
            let deleteAll = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            getContext().automaticallyMergesChangesFromParent = true
            
            try getContext().execute(deleteAll)
            saveContext()
        }catch{
            print("There is an error in deleting records")
        }
    }
}

