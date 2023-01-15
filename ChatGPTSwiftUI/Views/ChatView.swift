//
//  ChatView.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

struct ChatView: View {

    @EnvironmentObject private var api: ChatGPTAPI
    @State private var text = ""

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    Text(api.string)
                        .font(Font.myanmarSansPro(20))
                }
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .scrollDismissesKeyboard(.interactively)
            Divider()
            VStack {
                HStack(alignment: .bottom) {
                    TextField("Type message", text: $text, axis: .vertical)
                        .lineLimit(1...10)
                        .padding(5)
                        .font(Font.myanmarSansPro())
                    Button {
                        api.send(text)
                        text.removeAll()
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
