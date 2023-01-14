//
//  FullScreenPresenting.swift
//  MyBike
//
//  Created by Aung Ko Min on 29/11/21.
//

import SwiftUI

public enum ModelType {
    case fullScreen, sheet
}

public struct TapToPresentStyle<Destination: View>: ViewModifier {
    
    let destination: Destination
    let modelType: ModelType
    
    @State private var isSheet = false
    @State private var isFullScreen = false
    
    public func body(content: Content) -> some View {
        Button {
            switch modelType {
            case .fullScreen:
                isFullScreen = true
            case .sheet:
                isSheet = true
            }
        } label: {
            content
        }
        .buttonStyle(.plain)
        .fullScreenCover(isPresented: $isFullScreen) {
            destination
        }
        .sheet(isPresented: $isSheet) {
            destination
        }
    }
}


public extension View {
    func tapToPresent<Destination: View>(_ view: Destination, _ modelType: ModelType = .sheet) -> some View {
        ModifiedContent(content: self, modifier: TapToPresentStyle(destination: view, modelType: modelType))
    }
}
