//
//  SelectionView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 23.03.23.
//

import Foundation
import SwiftUI

struct SelectionView: View {
    @State var categories: [Option]
    var options: [String]
    var action: () async -> Void
    @Binding var selectedOption: String
    
    
    
    init( selectedOption: Binding<String>, categories: [Option] = [], options: [String] = [], action: @escaping () async -> Void = {}) {
        self._selectedOption = selectedOption
        self.categories = categories
        self.options = options
        self.action = action
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                if options.isEmpty {
                    ForEach(categories, id: \.id) { category in
                        Button {
                            selectedOption = category.title
                            Task.init(operation: {
                              await action()
                            })
                        } label: {
                            HStack{
                                Image(systemName: selectedOption == category.title ? "checkmark.square.fill" : "square")
                                    .foregroundColor(Color("ColumbiaBlue"))
                                Text(category.title).foregroundColor(.black)
                            }
                        }
                        
                    }
                }
                else {
                    ForEach(options, id: \.self) { option in
                        Button {
                            selectedOption = option
                            Task.init(operation: {
                              await action()
                            })
                            
                        } label: {
                            HStack{
                                Image(systemName: selectedOption == option ? "checkmark.square.fill" : "square")
                                    .foregroundColor(Color("ColumbiaBlue"))
                                Text(option).foregroundColor(.black)
                            }
                        }
                        
                    }
                    
                }
            }
        }
    }
}


//
//import Foundation
//import SwiftUI
//
//struct SelectionView: View {
//    var categories: [FilterButton]  {[
//        FilterButton(title: "Regelmässig"),
//        FilterButton(title: "Unregelmässig"),
//        FilterButton(title: "Trennbar"),
//        FilterButton(title: "Reflexive"),
//        FilterButton(title: "Modalverb")
//    ]}
//    @Binding var selectedOption: String
//
//    init( selectedOption: Binding<String>) {
//        self._selectedOption = selectedOption
//    }
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false){
//            VStack(alignment: .leading){
//                ForEach(categories, id: \.id) { category in
//                    Button {
//                        selectedOption = category.title
//                    } label: {
//                        HStack{
//                            Image(systemName: selectedOption == category.title ? "checkmark.square.fill" : "square")
//                                .foregroundColor(Color("ColumbiaBlue"))
//                            Text(category.title).foregroundColor(.black)
//                        }
//                    }
//
//                }
//            }
//        }
//    }
//}

