//
//  FilterBarView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 19.03.23.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct FilterbarView: View {
    @ObservedObject private var vm = VerbListViewModel()
    @State var buttonSelected: String = "All"
    @State var selectedVerbsByCategory: [VerbViewModel] = []
    var Buttons: [FilterButton]
    
    init(Buttons: [FilterButton]) {
        self.Buttons = Buttons
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Buttons, id: \.id) { button in
                        Button {
                            Task {
                                await vm.populateVerbs()
                            }
                            buttonSelected = button.title
                            
                        } label: {
                            Text(button.title).foregroundColor(.black)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(buttonSelected == button.title ? .white : .black, lineWidth: 1.5)
                                )
                        }
                    }
                }.padding([.leading, .trailing], 5)
            }
            VerbListView(verbs: buttonSelected == "All" ? vm.verbs :  vm.verbs.filter({verb in
                verb.category == buttonSelected
            }), isFavoriteView: false, onDelete: {indexSet in
                for index in indexSet {
                    let verb = vm.verbs[index]
                    Task{
                        await vm.deletVerb(id: verb.id)
                    }
                }
                vm.verbs.remove(atOffsets: indexSet)
            })
        }
        
    }
    
}
