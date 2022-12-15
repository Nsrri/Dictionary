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
    let Data = Bundle.main.decode([verbsInformationsModel].self, from:"Verbs.json")
    
    var body: some View {
        VStack(alignment: .center){
            VStack{
                Image("AppLogo")
                    .resizable()
                    .frame(width: 250, height: 200, alignment: .center)
                Text("Wörterbuch").bold()
                Text("by Nasrin")
                    .padding(3)
                    .background(Color.gray)
                Text("\(verbs.count)")
                ForEach(verbs, id:\.id){ verb in
                    VStack{
                        Text("\(verb.verb!)")
                    
                        Text("\(verb.explanation!)")
                      
                        ForEach(verb.tenses!, id:\.self){ tense in
                           Text("\(tense)")
                        }
                    }
                    
                    
                }

            }
            .frame(alignment: .center)
            Spacer()
          
            
        }
    }
}

