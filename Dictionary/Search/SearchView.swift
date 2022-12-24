//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI
import UIKit

struct SearchView: View {
     @ObservedObject var dataController = DataController()
     @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
     var listOFFavorites : [Verbs] {
        dataController.getVerbsWith(favorite: true)
    }


    @State var searchText: String = ""
    @State var isSearching: Bool = false
    @State var saveToFavorites: Bool = false
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(alignment: .center){
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    if(!searchText.isEmpty && dataController.getAllVerbs().count != 0){
                    List(){
                        ForEach(verbs, id: \.id) { data in
                            if(data.verb!.hasPrefix(searchText)) {
                                NavigationLink(destination: DynamicVerbsView(verb: data.verb!, conjunctions: data.conjunctions!, tenses: data.tenses!, explanation: data.explanation!, examples: data.examples!)
                                    .navigationTitle(data.verb!)
                                    .toolbar(content: {
                                        Button {
                                            if (data.favorite == true){
                                                data.favorite = false
                                                saveToFavorites = false
                                            }else{
                                                data.favorite = true
                                                saveToFavorites = true
                                            }
                                            dataController.saveContext()
                                        }label: {
                                            listOFFavorites.contains(data) ?  Text("delete") : Text("save")
                                        }

                                    })
                                    .navigationBarTitleDisplayMode(.inline)){
                                    Text(data.verb!)
                                }

                            }
                        }
                    }.listStyle(.plain)
                } else{
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            
        } .navigationTitle("Verbs")

        }
    }
    
}








