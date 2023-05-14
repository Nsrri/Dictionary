//
//  ErrorView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 14.05.23.
//

import Foundation
import SwiftUI

struct ErrorViewMessage:  View {
    var message: String
    var icon: String
    
    public init(message: String = "Ein Fehler ist aufgetreten", icon: String = "exclamationmark.triangle") {
        self.message = message
        self.icon = icon
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(message)
            Image(systemName: icon)
        }

    }
}
