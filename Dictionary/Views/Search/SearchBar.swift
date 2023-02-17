//
//  Search.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 26.11.22.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding  var searchText: String
    @Binding  var isSearching: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color("LightGray"))
                    .border(Color("Graye5"))
                    .background(Color("Graye5"))
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchText){ startedEditing in
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
                            self.isSearching = false
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
            .cornerRadius(11)
            .padding()
            
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
        //.background(Color("Lemon"))
    }
        
    }


extension UIApplication{
    func dismissKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
