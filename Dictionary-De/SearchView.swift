//
//  SearchView.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 08.10.22.
//

import SwiftUI
import UIKit

struct SearchView: View {
    //    let data: [Module]
    let Data = Bundle.main.decode([Module].self, from:"words.json")
    let exampleData = ["Apfel", "Ampel", "Banane", "Birne"]
    
    @State private var searchText = ""
    @State private var isSearching: Bool = false
    @State private var cancelButton: Bool = false
    @FocusState private var textFieldIsFocused: Bool


    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                HStack(alignment: .center, spacing: 0){
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("LightGray"))
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("Search for...", text: $searchText)
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
                    .onTapGesture(count: 1) {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
                List{
                    ForEach(searchResults, id: \.self){ word in
                        NavigationLink(destination: Text(word)){
                            Text(word)
                        }
                        
                        
                    }
                }
                
                
                
            } .navigationTitle("Words")
        }
        
    }
    
    var searchResults: [String]{
        if searchText.isEmpty{
            return exampleData
        } else{
            return exampleData.filter{$0.contains(searchText)}
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


