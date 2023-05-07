//
//  QuestionListViewModel.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 20.04.23.
//

import Foundation
import SwiftUI


final class QuestionListViewModel: ObservableObject {
 
    
    @Published var questions: [QuestionViewModel] = []
    
    init() {
        Task {
            await self.getAllQuestions()
        }
    }
    
    
    
    func getAllQuestions() async {
        
        do{
            let questions = try await NetworkHandler().getAllQuestions()
            DispatchQueue.main.async {
                self.questions = questions.map(QuestionViewModel.init)
            }
         
        } catch {
            
        }
        
        
    }
     
    
    func updateUserAnswer(questionVM: QuestionViewModel) async {
        let updatedQuestion = Question(_id: questionVM.id, question: questionVM.question, options: questionVM.options, answer: questionVM.answer, userAnswer: questionVM.userAnswer, point: questionVM.point)
        do {
            let returnedQuestion = try await NetworkHandler().UpdateUserAnswer(question: updatedQuestion)
            DispatchQueue.main.async {
                if let index = self.questions.firstIndex(where: { $0.id == returnedQuestion._id }) {
                    self.questions[index] = QuestionViewModel(question: returnedQuestion)
                    
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    func updatePoint(question: QuestionViewModel) async {
        let updatedQuestion = Question(_id: question.id, question: question.question, options: question.options, answer: question.answer, userAnswer: question.userAnswer, point: question.point)
        do {
            let returnedQuestion = try await NetworkHandler().UpdatePoint(question: updatedQuestion)
            DispatchQueue.main.async {
                if let index = self.questions.firstIndex(where: { $0.id == returnedQuestion._id }) {
                    self.questions[index] = QuestionViewModel(question: returnedQuestion)
                    
                }
            }
            
        } catch {
            print(error)
        }
    }

    
}












struct QuestionViewModel: Identifiable, Codable{
    static func == (lhs: QuestionViewModel, rhs: QuestionViewModel) -> Bool {
        return lhs.question == rhs.question
    }
    
    
    var questionViewModel: Question
    
    init(question: Question) {
        self.questionViewModel = question
    }
    
    var id: String {
            questionViewModel._id
    }
    
    var question: String {
            questionViewModel.question
    }
    
    var answer: String {
        questionViewModel.answer
    }
    
    var userAnswer: String {
        get {
            questionViewModel.userAnswer
        }
        set {
            questionViewModel.userAnswer = newValue
        }
    }
    
    var point: Int {
        get {
            questionViewModel.point
        }
        set {
            questionViewModel.point = newValue
        }
    }
    var options: [String] {
        get {
            questionViewModel.options
        }
        set {
            questionViewModel.options = newValue
        }
    }
    
}
