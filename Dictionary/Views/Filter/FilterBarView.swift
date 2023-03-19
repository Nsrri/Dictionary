//
//  FilterBarView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 19.03.23.
//

import Foundation
import SwiftUI

struct FilterbarView: View {
    var Buttons: [FilterButton]
    
    init(Buttons: [FilterButton]) {
        self.Buttons = Buttons
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Buttons, id: \.id) { button in
                    Button {
                        Task{
                            await button.action()
                        }
                    } label: {
                        Text(button.title).foregroundColor(.black)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(.black, lineWidth: 1.5)
                            )
                    }
                    
                    
                }
            }
        }
    }
    
}
