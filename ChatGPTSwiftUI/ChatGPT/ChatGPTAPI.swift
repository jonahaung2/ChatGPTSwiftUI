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
                self.string = value
            }
            .store(in: &cancellables)
    }

    func send(_ string: String) {
        let script = "window.sendMsg('\(string)');"
        ChatGPTWebViewStore.shared.webView.evaluateJavaScript(script)
    }
}
