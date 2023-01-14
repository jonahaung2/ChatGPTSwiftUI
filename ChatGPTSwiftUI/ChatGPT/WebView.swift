//
//  WebView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI
import WebKit

struct WebView: View, UIViewRepresentable {
    let webView: WKWebView
    init(webView: WKWebView) {
        self.webView = webView
    }
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        webView.configuration.websiteDataStore = .default()
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {}
}
