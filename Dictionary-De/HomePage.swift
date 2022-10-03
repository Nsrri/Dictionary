//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

struct HomePage: View {
    var Wort = Bundle.main.decode([Module].self, from: "Worter.json")
    var body: some View {
       
                    ForEach(Wort) { x in
                        Text(x.article)
                    }
        }

    }

