//
//  ChatGPTAPI.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import Foundation
import Combine
import Translator

class ChatGPTAPI: ObservableObject {

    static let shared = ChatGPTAPI()

    @Published var string = ""
    private var cancellables = Set<AnyCancellable>()
    private let webStore = ChatGPTWebViewStore.shared

    init() {
        webStore
            .$receivedMsg
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .sink {[weak self] value in
                guard let self else { return }
                self.translate(value)
            }
            .store(in: &cancellables)
    }

    func send(_ string: String) {
        if string.isMyanar {
           GoogleTranslator.shared.translate(string, .burmese, .english) { [weak self] english, _ in
               guard let self else { return }
               DispatchQueue.main.async {
                   guard let english else { return }
                   print(english)
                   let script = "window.sendMsg('\(english)');"
                   self.webStore.webView.evaluateJavaScript(script)
               }
            }
        } else {
            let script = "window.sendMsg('\(string)');"
            webStore.webView.evaluateJavaScript(script)
        }
    }

    func translate(_ text: String) {
        GoogleTranslator.shared.translate(text, .english, .burmese) {[weak self] string, error in
            guard let self else { return }
            DispatchQueue.main.async {
                if let string {
                    self.string = string
                }
            }
        }
    }
}
