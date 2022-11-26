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
