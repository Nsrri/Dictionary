//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI
import UIKit

struct SearchView: View {
    let Data = Bundle.main.decode([verbsInformationsModel].self, from:"Verbs.json")
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    

    
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    @State var isFavorite: Bool = false

    var AllVerbs: [String]{
        var result = [String]()
        for data in Data {
            result.append(data.verb)
        }
        return result
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(alignment: .center){
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                if(!searchText.isEmpty){
                    List(){
                        ForEach(Data, id: \.id){ data in
                            if(data.verb.hasPrefix(searchText)) {
                                
                                NavigationLink(destination: DynamicVerbsView(verb: data.verb, conjunctions: data.conjunctions, tenses: data.tenses, explanation: data.explanation, examples: data.examples)
                                    .navigationTitle(data.verb)
                                    .toolbar(content: {
                                        Button {
                                            isFavorite.toggle()
                                        } label: {
                                            !isFavorite ?   Image(systemName: "star") :   Image(systemName: "star.fill")
                                          
                                        }
                                    })
                                    .navigationBarTitleDisplayMode(.inline)){
                                    Text(data.verb)
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


//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}






