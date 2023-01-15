//
//  Home.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var verbs: FetchedResults<Verbs>
     var verbsCount: Int {
       return verbs.count
    }
    var percentageCalculatior =  PercentageCalculatior()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center){
                VStack{
                    Text("Wörterbuch").bold()
                        .padding(.top, 40)
                    ZStack{
                        createRings()
                        createCurrentValueText(radius: 250.0)
                    }
                    Text("Du bist deinem Ziel \(String(format: "%.2f", percentageCalculatior.getAddedVerbsPercentage(verbs))) % näher gekommen :)")
                        .font(Font.system(size: 15.0, weight: .bold, design: .rounded))
                        .padding(3)
                        .background(Color.gray)
                }
                Spacer()
            }.frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color("Lemon"))
            
        }
    }
    
    func createRings() -> some View {
        ZStack{
            RingView(percentage: percentageCalculatior.getAddedVerbsPercentage(verbs), backgroundColor: Color("Khaki"), startColor: Color("Wisteria"), endColor: Color("RoyalPurple"), thickness: 20)
                .frame(width: 280, height: 280)
                              .aspectRatio(contentMode: .fit)
        }
    }
    
    private func createCurrentValueText(radius: CGFloat) -> some View {
        let diametr = radius * 2.0 - 44.0 * 2.0 - 16.0
          return Group {
              Text("\(String(format: "%.2f", percentageCalculatior.getAddedVerbsPercentage(verbs)))")
                  .font(Font.system(size: 50.0, weight: .bold, design: .rounded))
              +
              Text("%")
                  .font(Font.system(size: 30.0, weight: .bold, design: .rounded))
                  .baselineOffset(15.0)
          }
          .frame(width: diametr, height: 75.0, alignment: .center)
          .minimumScaleFactor(0.5)
      }
}

