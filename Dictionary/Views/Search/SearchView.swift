//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SearchView: View {
    
    @ObservedObject private var vm = VerbListViewModel()
    @StateObject var States: searchStates = searchStates()
    var ListOfButton: [FilterButton] = [FilterButton(title: "All", action: {}),FilterButton(title: "Regelmässig", action: {}),FilterButton(title: "Unregelmässig", action: {}),FilterButton(title: "Trennbar", action: {}),FilterButton(title: "Reflexive", action: {}),FilterButton(title: "Modalverben", action: {})]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                SearchBar(
                    searchText: $States.searchText,
                    isSearching: $States.isSearching
                )
                FilterbarView(Buttons: ListOfButton)
                    .padding(10)
                if canSearch {
                    List{
                        ForEach(vm.verbs, id: \.id) { data in
                            if(data.verb.hasPrefix(States.searchText.lowercased())) {
                                VerbCellView(verb: data)
                            }
                        }
                        
                    }.background(Color("Lemon"))
                        .scrollContentBackground(.hidden)
                        .listStyle(.automatic)
                }
                else{
                    VerbListView(verbs: vm.verbs, isFavoriteView: false)
                }
                
            }.task {
                await vm.populateVerbs()
            }
            .navigationTitle("Verben")
            .background(Color("Lemon"))
        }
    }
}


@available(iOS 16.0, *)

extension SearchView {
   private var canSearch: Bool{
       return !States.searchText.isEmpty
    }
}


class searchStates: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    @Published var saveToFavorites: Bool = true
    
}

