//
//  ContentView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var webViewStore = ChatGPTWebViewStore.shared
    @State private var showModal: Bool = false


    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    WebView(webView: webViewStore.webView)
                    ChatView()
                }

            }
            .navigationTitle("Chat GPT")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: loginButton)
            .task(id: showModal, priority: .background) {
                if !showModal {
                    webViewStore.webView.load(URLRequest(url: URL(string: "https://chat.openai.com/")!))
                }
            }
            .sheet(isPresented: $showModal) {
                ChatGPTAuthView()
            }
        }
    }


    private var loginButton: some View {
        Button {
            showModal = true
        } label: {
            Text("Login")
        }


    }
}
