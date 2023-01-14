//
//  ChatGPTSwiftUIApp.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

@main
struct ChatGPTSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ChatGPTAPI.shared)
        }
    }
}
