//
//  Home.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
    
    @State var showingAddScreen = false

    var body: some View {
//        VStack(alignment: .center){
//            VStack{
//                Image("AppLogo")
//                    .resizable()
//                    .frame(width: 250, height: 200, alignment: .center)
//                Text("Wörterbuch").bold()
//                Text("by Nasrin")
//                    .padding(3)
//                    .background(Color.gray)
//
//            }.frame(alignment: .center)
//            Spacer()
//        }
        NavigationView {
           Text("Count: \(verbs.count)")
               .navigationTitle("Verbs")
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button {
                           showingAddScreen.toggle()
                       } label: {
                           Label("Add Verbs", systemImage: "plus")
                       }
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddVerb()
               }
       }
    }
}

