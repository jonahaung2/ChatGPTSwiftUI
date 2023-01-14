//
//  ChatGPTAuthView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI
import WebKit

struct ChatGPTAuthView: View {

    @StateObject private var webViewStore = WebViewStore()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            WebView(webView: webViewStore.webView)
                .onAppear {
                    let request = URLRequest(url: URL(string: "https://chat.openai.com/")!)
                    self.webViewStore.webView.load(request)
                }
                .onChange(of: self.webViewStore.webView.url?.absoluteString) { newValue in
                    if newValue != "https://chat.openai.com/chat" {
                        return
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.webViewStore.webView.url?.absoluteString == "https://chat.openai.com/chat" {
                            dismiss()
                        }
                    }
                }
        }
    }
}
