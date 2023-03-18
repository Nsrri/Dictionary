//
//  SaveButtonView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import Foundation
import SwiftUI

struct SaveButtonView: View {
    
    @Binding var data: VerbViewModel
    var action: () async -> Void
    
    init(data: Binding<VerbViewModel> ,action: @escaping () async -> Void) {
        self._data = data
        self.action = action

    }
    
    var body: some View {
        Button {
            Task.init(operation: {
                    await action()
            })
        }label: {
            data.favorite ?  Image(systemName: "star.fill") : Image(systemName: "star")
        }
    }
}
