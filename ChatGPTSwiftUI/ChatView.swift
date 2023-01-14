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
                        .fontDesign(.serif)
                }
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .scrollDismissesKeyboard(.interactively)

            VStack {
                HStack(alignment: .bottom) {
                    TextField("Type message", text: $text, axis: .vertical)
                        .lineLimit(1...10)
                        .padding(5)
                    Button {
                        api.send(text)
                        text.removeAll()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .disabled(text.isEmpty)
                }
                .padding(8)
            }
            .background(.bar)
        }
        .background()
    }
}
