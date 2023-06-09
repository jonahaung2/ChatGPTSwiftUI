//
//  ChatView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

struct ChatView: View {

    @StateObject private var api: ChatGPTAPI = .shared
    @State private var text = ""
    @State private var answers = [Answer]()

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            List {
                ForEach(answers) { ans in
                    Section {
                        Text(ans.question)
                            .font(Font.myanmarSansPro())
                            .foregroundStyle(.secondary)
                        Text(ans.answer)
                            .font(Font.myanmarSansPro(19))
                            .textSelection(.enabled)
                    }
                }
            }
            .animation(.default, value: answers)
            .scrollDismissesKeyboard(.interactively)
            .onChange(of: api.string) {
                answers.first?.answer = $0
            }
            Divider()
            VStack {
                HStack(alignment: .bottom) {
                    TextField("Type message", text: $text, axis: .vertical)
                        .lineLimit(1...10)
                        .padding(5)
                        .font(Font.myanmarSansPro())
                    Button {
                        let ans = Answer(text)
                        api.send(text)
                        text.removeAll()
                        self.answers.insert(ans, at: 0)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(text.isEmpty ? Color.secondary : Color.blue)
                            .clipShape(Circle())
                    }
                    .disabled(text.isEmpty)
                }
                .padding(10)
            }
        }
        .background()
    }
}
