//
//  Home.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.

import SwiftUI

@available(iOS 16.0, *)
struct HomeView: View {
    
    @ObservedObject var vm = VerbListViewModel()
    @ObservedObject var quizvm = QuestionListViewModel()
    @State var StartQuiz: Bool = false
    var percentageCalculatior =  PercentageCalculatior()
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(alignment: .center) {
                    VStack{
                        Text("Wörterbuch").bold()
                            .padding(.top, 40)
                        ZStack{
                            createRings()
                            createCurrentValueText(radius: 250.0)
                        }
                        Text("Du bist deinem Ziel \(String(format: "%.2f", percentageCalculatior.getAddedVerbsPercentage(vm.verbs))) % näher gekommen :)")
                            .font(Font.system(size: 15.0, weight: .bold, design: .rounded))
                            .padding(3)
                            .background(Color.gray)
                    }
                    QuizIntro(name: "Start", action: {StartQuiz = true}, showView: $StartQuiz, navigateTo: QuestionListView())
                        .padding(.top, 40)
                    Spacer()
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color("Lemon"))
                    .task {
                        await vm.populateVerbs()
                    }
            }
        }
    }
    
    func createRings() -> some View {
        ZStack{
            RingView(percentage: percentageCalculatior.getAddedVerbsPercentage(vm.verbs), backgroundColor: Color("Khaki"), startColor: Color("Wisteria"), endColor: Color("RoyalPurple"), thickness: 20)
                .frame(width: 280, height: 280)
                .aspectRatio(contentMode: .fit)
        }
    }
    
    private func createCurrentValueText(radius: CGFloat) -> some View {
        let diametr = radius * 2.0 - 44.0 * 2.0 - 16.0
        return Group {
            Text("\(String(format: "%.2f", percentageCalculatior.getAddedVerbsPercentage(vm.verbs)))")
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

