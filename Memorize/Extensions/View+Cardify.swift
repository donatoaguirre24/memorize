//
//  View+Cardify.swift
//  memorize
//
//  Created by Donato Aguirre on 18/10/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct CardifyViewModifier<S>: ViewModifier where S: ShapeStyle {
    var color: S
    var isFaceUp: Bool
    var isMatched: Bool

    init(_ color: S, _ isFaceUp: Bool, _ isMatched: Bool) {
        self.color = color
        self.isFaceUp = isFaceUp
        self.isMatched = isMatched
    }

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: borderRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: borderRadius).stroke(color, lineWidth: borderWidth)
                content
            } else if !isMatched {
                RoundedRectangle(cornerRadius: borderRadius).fill(color)
            }
        }
    }

    // MARK: - Drawing Constants

    private let borderRadius: CGFloat = 10
    private let borderWidth: CGFloat = 3
}

extension View {
    func cardify<S>(color: S, isFaceUp: Bool, isMatched: Bool) -> some View where S: ShapeStyle {
        modifier(CardifyViewModifier(color, isFaceUp, isMatched))
    }
}
