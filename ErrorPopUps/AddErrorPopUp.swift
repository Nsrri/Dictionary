//
//  AddErrorPopUp.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 17.12.22.
//

import SwiftUI

struct AddErrorPopUp: View {
    @Binding var showPopUp: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Text("Error")
                        .font(.largeTitle)
                        .foregroundColor(Color("white3"))
                }.frame(maxWidth: .infinity)
                    .background(Color("midblack3"))
                Divider()
                VStack{
                    Text("Sorry the verb you're trying to add exists!")
                        .font(.largeTitle)
                        .foregroundColor(Color("white3"))
                }.frame(maxWidth: .infinity)
                    .background(Color("midblack2"))
                Divider()
                VStack{
                    Button {
                        showPopUp = false
                    } label: {
                        Text("Error")
                            .font(.largeTitle)
                            .foregroundColor(Color("white3"))
                    }
                    }.frame(maxWidth: .infinity)
                        .background(Color("midblack3"))
            }.frame(width: geometry.size.width * 0.8)
        }
    }
}

