////
////  QuestionView.swift
////  Dictionary
////
////  Created by Nasrin Jafari on 17.04.23.
////
//
import Foundation
import SwiftUI


struct QuestionListView: View {
    @ObservedObject private var vm =  QuestionListViewModel()
    @State var selectedOption = ""
    @State var next: Bool
    @State var back: Bool
    @State var isSubmitted: Bool = false
    @State var count = 0
    
    init( next: Bool = false, back: Bool = false ) {
        self.next = next
        self.back  = back

    }

    var body: some View {
        NavigationView {
            GeometryReader { geomerty in
                ScrollView {
                    ForEach(vm.questions, id: \.id) { que in
                        QuestionView(questionVM: que, isSubmitted: $isSubmitted)
                        
                    }
                    submitButton()
                }
                .task {
                    await vm.getAllQuestions()
                }
            }
            .navigationBarTitle("Fragen")
        }
        
    }
}


extension QuestionListView {
    func submitButton() -> some View {
        Button {
            isSubmitted = true
            Task{
                await vm.getAllQuestions()
            }
        } label: {
            Text("Absenden")
        }.buttonStyle(.borderedProminent)
    }

}




struct QuestionView: View {
    @ObservedObject private var vm =  QuestionListViewModel()
    @State var questionVM: QuestionViewModel
    @State var selectedOption = ""
    @Binding var isSubmitted: Bool
    
    init( questionVM: QuestionViewModel, isSubmitted: Binding<Bool>) {
        self.questionVM = questionVM
        self._isSubmitted = isSubmitted
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(questionVM.question)
                    .font(.headline)
                Spacer()
              if  isSubmitted {
                    Text("point \(questionVM.point)/1")
                }
            }
            Divider()
            SelectionView(selectedOption: $selectedOption, options: questionVM.options, action: {
                isSubmitted = false
                questionVM.userAnswer = selectedOption
                selectedOption = questionVM.userAnswer
                if (questionVM.userAnswer == questionVM.answer){
                    questionVM.point = 1
                    
                }else {
                    questionVM.point = 0
                }
                Task{
                    await vm.updateUserAnswer(questionVM: questionVM)
                    await vm.updatePoint(question: questionVM)
                    
                }
            })
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
        
    }
    
