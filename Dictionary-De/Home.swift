//
//  Home.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

struct Home: View {
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
                
            }.frame(alignment: .center)
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
