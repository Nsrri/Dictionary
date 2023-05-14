//
//  NavigationButton.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 17.04.23.
//

import Foundation
import SwiftUI

struct NavigationButton: View {
    var name: String
    var action: () -> Void
    var paddingVertical: CGFloat
    var paddingHorizontal: CGFloat
    var paddingTop: CGFloat
    
    init(name: String, action: @escaping () -> Void, paddingVertical: CGFloat =  6, paddingHorizontal: CGFloat = 20, paddingTop: CGFloat = 70) {
        self.name = name
        self.action = action
        self.paddingVertical = paddingVertical
        self.paddingHorizontal = paddingHorizontal
        self.paddingTop = paddingTop
    }
    
    
    var body: some View {
        Button {
            action()
            
        } label: {
            Text(name)
                .padding(.vertical, paddingVertical)
                .padding(.horizontal, paddingHorizontal)
            
        }.buttonStyle(.borderedProminent)
            .padding(.top, paddingTop)
    }
  
}
