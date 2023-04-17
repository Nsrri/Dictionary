//
//  QuestionView.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 17.04.23.
//

import Foundation
import SwiftUI


struct QuestionView: View {
    var question: String
    var options: [String]
    @State var selectedOption: String = ""
    var points: Int = 0
    @State var next: Bool
    @State var back: Bool
    
    init(question: String, options: [String], points: Int, next: Bool = false, back: Bool = false) {
        self.question = question
        self.options = options
        self.points = points
        self.next = next
        self.back  = back
    }
    var body: some View {
        NavigationView {
            VStack {
                Text(question)
                SelectionView(selectedOption: $selectedOption, categories: [])
                
            }
            
        }
     
    }
}

