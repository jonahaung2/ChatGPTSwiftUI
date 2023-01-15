//
//  EmbeddingInNavigationView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 2/5/22.
//

import SwiftUI
public struct EmbeddingInNavigationViewModifier: ViewModifier {
    let canCancel: Bool
    public func body(content: Content) -> some View {
        PickerNavigationView(canCancel: canCancel) {
            content
        }
    }
}

public extension View {
    func embeddedInNavigationView(canCancel: Bool = false) -> some View {
        ModifiedContent(content: self, modifier: EmbeddingInNavigationViewModifier(canCancel: canCancel))
    }
}
