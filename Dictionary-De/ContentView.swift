//
//  ContentView.swift
//  Dictionary-De
//
//  Created by Nasrin Jafari on 26.06.22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var Wort =  Bundle.main.decode([Wörter].self, from: "Wörter.json")
    @State var searchText: String
    var body: some View {
        NavigationView{
            List{

            }
        }

    }
//    var searchResults : String{
//        if searchText.isEmpty{
//                return Wort.wort
//            }
//        }else{
//            return Wort.filter({$0.contains(searchText)})
//        }
        
    }


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(, searchText: <#String#>)
//    }
//}
