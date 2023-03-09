//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SearchView: View {
    
//    @ObservedObject var dataController = DataController()
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Verbs.verb, ascending: true)]) var verbs: FetchedResults<Verbs>
    
    @ObservedObject private var vm = VerbListViewModel()
    @StateObject var States: searchStates = searchStates()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                SearchBar(
                    searchText: $States.searchText,
                    isSearching: $States.isSearching
                )
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
                    VerbListView(verbs: vm.verbs)
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
extension SearchView{
    
//   private var listOFFavorites : [Verbs] {
//        dataController.getVerbsWith(favorite: true)
//    }
   private var canSearch: Bool{
       return !States.searchText.isEmpty
    }
}


class searchStates: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    @Published var saveToFavorites: Bool = true
    
}


// MARK: The plan for this view is if the server in not able to respond or there is internet conncetion problems then user should be able to fetch data from CoreData
