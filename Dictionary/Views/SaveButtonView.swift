//
//  SaveButtonView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import Foundation
import SwiftUI

struct SaveButtonView: View {
    
    var data: VerbViewModel
    var action: () -> Void
    
    init(data: VerbViewModel ,action: @escaping () -> Void) {
        self.data = data
        self.action = action

    }
    
    var body: some View {
        Button {
            action()
        }label: {
            data.favorite ?  Image(systemName: "star.fill") : Image(systemName: "star")
        }
    }
    
}
