//
//  Favorites.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct FavoriteVerbsView: View {
    @ObservedObject var dataConrtoller = DataController()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    
    func deleteItem(offsets: IndexSet) {
        for offset in offsets{
            let verb = verbs[offset]
            if (verb.favorite == true){
                verb.favorite = false
            }
        }
        dataConrtoller.saveContext()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(verbs, id: \.id) {  fav in
                        if fav.favorite{
                            NavigationLink(destination: DynamicVerbsView(verb: fav.verb!, conjunctions: fav.conjunctions!, tenses: fav.tenses!, explanation: fav.explanation!, examples: fav.examples!)
                                .navigationTitle(fav.verb!)
                                .navigationBarTitleDisplayMode(.inline)){
                                    Text(fav .verb!)
                                }
                        }
                    }.onDelete(perform: deleteItem)
                }.listStyle(.plain)
                    .background(Color("Lemon"))
                        .scrollContentBackground(.hidden)
            }
        }
    }
}

