//
//  Answer.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import Foundation

class Answer: ObservableObject, Identifiable {
    var id: String { question }
    let question: String
    @Published var answer = ""

    init(_ question: String) {
        self.question = question
    }
}
extension Answer: Equatable {
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        lhs.id == rhs.id
    }
}
