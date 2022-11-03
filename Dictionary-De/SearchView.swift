//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI
import UIKit

struct SearchView: View {
    let Data = Bundle.main.decode([verbsInformations].self, from:"words.json")
//    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    
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
                HStack(alignment: .center, spacing: 0){
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    if isSearching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation{
                                isSearching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                            
                        }.padding([.trailing], 6)
                    }
                }
                .onTapGesture(count: 1) {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
             
                if(!searchText.isEmpty){
                    List(){
                        ForEach(Data, id: \.id){ data in
                            if(data.verb.hasPrefix(searchText)) {
                                
                                NavigationLink(destination: DynamicVerbsView(verb: data.verb, tenses: data.tenses, pasts: data.pasts, explanation: data.explanation, examples: data.examples)
                                    .navigationTitle(data.verb)
                                    .toolbar(content: {
                                        Button {
                                            isFavorite = !isFavorite
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



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


extension UIApplication{
    func dismissKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}





struct SearchBar: View {
    @Binding  var searchText: String
    @Binding  var isSearching: Bool
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for...", text: $searchText){ startedEditing in
                    if startedEditing {
                        withAnimation {
                            isSearching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        isSearching = false
                    }
                }
                .foregroundColor(.black)
                if !searchText.isEmpty{
                    Button {
                        self.searchText = ""
                        self.isSearching = true
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .foregroundColor(.secondary)
                    .padding(.trailing, 4)
                    
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
        
    }
}
