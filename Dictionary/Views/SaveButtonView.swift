//
//  SaveButtonView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 12.02.23.
//

import Foundation
import SwiftUI

struct SaveButtonView: View {
    @Binding var isFav: Bool
    @Binding var saveToFavs: Bool
    var action: () -> Void
    var isAlreadySaved: Bool
    
    init(isFav: Binding<Bool>, saveToFavs: Binding<Bool>, action: @escaping () -> Void, isAlreadySaved: Bool = false) {
        self._isFav = isFav
        self._saveToFavs = saveToFavs
        self.action = action
        self.isAlreadySaved = isAlreadySaved
    }
    
    var body: some View {
        Button {
            if (isFav == true){
                isFav = false
                saveToFavs = false
            }else{
                isFav = true
                saveToFavs = true
            }
            action()
        }label: {
            isAlreadySaved ?  Image(systemName: "star.fill") : Image(systemName: "star")
        }
    }
    
}
