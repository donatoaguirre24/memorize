//
//  CardView.swift
//  memorize
//
//  Created by Donato Aguirre on 9/17/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let color: Color

    var themeColor: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [color, color.opacity(0.3)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20))
                    .fill(themeColor)
                    .opacity(0.4)
                    .padding(5)
                Text(card.content)
            }
            .cardify(color: themeColor, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
            .font(.system(size: fontSize(for: geometry.size)))
        }
    }

    // MARK: - Drawing Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card(isFaceUp: true, content: "🧪"), color: Color.red)
            CardView(card: Card(isFaceUp: false, content: "🧪"), color: Color.red)
        }
    }
}
