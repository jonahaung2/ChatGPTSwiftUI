//
//  Extensions.swift
//  ChatGPTSwiftUI
//
//  Created by Aung Ko Min on 15/1/23.
//

import SwiftUI

extension String {
    var language: String { NSLinguisticTagger.dominantLanguage(for: self) ?? ""}
    var isMyanar: Bool { language == "my" }
    var isEnglish: Bool { language == "eng" }
}

extension Font {

    static func myanmarSansPro(_ size: CGFloat = UIFont.buttonFontSize) -> Font {
        Font.custom("MyanmarSansPro", size: size)
    }
}
