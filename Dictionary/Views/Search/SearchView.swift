//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SearchView: View {
    @ObservedObject var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    @State var saveToFavorites: Bool = false
    
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(alignment: .center, spacing: 0){
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    if isAbleToSearch(){
                        List{
                            ForEach(verbs, id: \.id) { data in
                                if(data.verb!.lowercased().hasPrefix(searchText.lowercased())) {
                                    NavigationLink(
                                        destination:
                                            DynamicVerbsView(verb: data.verb!, conjunctions: data.conjunctions!, tenses: data.tenses!, explanation: data.explanation!, examples: data.examples!)
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
                                                    listOFFavorites.contains(data) ?  Image(systemName: "star.fill") : Image(systemName: "star")
                                                }
                                            })
                                            .navigationBarTitleDisplayMode(.inline)){
                                                Text(data.verb!)
                        
                                            }
                                }
                            }
                         
                        }.background(Color("Lemon"))
                            .scrollContentBackground(.hidden)
                            .listStyle(.automatic)
                        
                    } else if(!isSearching){
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
            } .navigationTitle("Verben")
                .background(Color("Lemon"))
            
        }
    }
    
}

@available(iOS 16.0, *)
extension SearchView{
    var listOFFavorites : [Verbs] {
        dataController.getVerbsWith(favorite: true)
    }
    func isAbleToSearch() -> Bool{
        return !searchText.isEmpty && dataController.getAllVerbs().count != 0
    }
}








