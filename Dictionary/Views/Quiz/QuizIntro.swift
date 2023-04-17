//
//  QuizIntro.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 17.04.23.
//

import Foundation
import SwiftUI



struct QuizIntro: View {
    var name: String
    var action: () -> Void
    var description: String
    @Binding var showView: Bool
    var navigateTo: any View
    
    init(name: String, action: @escaping () -> Void, description: String = Strings.quizDescription ,showView: Binding<Bool> , navigateTo:  any View) {
        self.name = name
        self.action = action
        self.description = description
        self._showView = showView
        self.navigateTo = navigateTo
        
    }
    
    var body: some View {
        VStack {
            Text(description)
                .padding(15)
                .font(.system(size: 18, weight: .regular, design: .rounded))
            NavigationButton(name: name, action: {showView = true})
            NavigationLink("", isActive: $showView, destination: {AnyView(navigateTo)})
            
        }
    }
    
}

