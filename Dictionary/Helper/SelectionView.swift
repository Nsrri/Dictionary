//
//  SelectionView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 23.03.23.
//

import Foundation
import SwiftUI

struct SelectionView: View {
    var categories: [Option]
    @Binding var selectedOption: String
    
    init( selectedOption: Binding<String>, categories: [Option]) {
        self._selectedOption = selectedOption
        self.categories = categories
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                ForEach(categories, id: \.id) { category in
                    Button {
                        selectedOption = category.title
                    } label: {
                        HStack{
                            Image(systemName: selectedOption == category.title ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color("ColumbiaBlue"))
                            Text(category.title).foregroundColor(.black)
                        }
                    }
                    
                }
            }
        }
    }
}



