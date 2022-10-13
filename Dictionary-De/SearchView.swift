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
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    
    var AllVerbs: [String]{
        var result = [String]()
        for data in Data {
            result.append(data.verb)
        }
        return result
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
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
                List{
                    ForEach(AllVerbs.filter({ (verb: String) -> Bool in
                        
                        return verb.hasPrefix(searchText) || searchText == "" }), id: \.self) {
                            verb in
                            NavigationLink(destination: Text(verb)){
                                Text(verb)
                            }
                        }
                }
                
            } .navigationTitle("Words")
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
