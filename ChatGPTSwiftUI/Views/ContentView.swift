//
//  ContentView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("useBurmeseLange") var useBurmeseLange = true
    @State private var showControls = false

    var body: some View {
        ZStack {
            WebView(webView: ChatGPTAPI.shared.webStore.webView)
            ChatView()
        }
        .navigationTitle("Chat GPT (Myanmar)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: loginButton, trailing: trailingNavItem)
        .task(id: showControls) {
            if !showControls {
                ChatGPTAPI.shared.webStore.webView.load(URLRequest(url: URL(string: "https://chat.openai.com/")!))
            }
        }
        .fullScreenCover(isPresented: $showControls) {
            ChatGPTAuthView()
        }
    }


    private var loginButton: some View {
        Button {
            self.showControls = true
        } label: {
            Image(systemName: "applelogo")
        }

    }
    private var trailingNavItem: some View {
        Toggle(isOn: $useBurmeseLange) {
            Text("Burmese")
        }
    }
}
