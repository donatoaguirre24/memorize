//
//  Grid.swift
//  memorize
//
//  Created by Donato Aguirre on 9/13/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var spacing: CGFloat
    private var viewForItem: (Item) -> ItemView

    init(_ items: [Item], spacing: CGFloat = 5, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.spacing = spacing
        self.viewForItem = viewForItem
    }

    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(items) { item in
                    viewForItem(item)
                        .padding(spacing)
                        .frame(height: itemHeight(geometry.size.height))
                }
            }
        }
        .padding(spacing)
    }

    // MARK: - Drawing Constants

    private func itemHeight(_ height: CGFloat) -> CGFloat {
        let numberOfRows = items.count / 2
        let itemHeight = floor(height / CGFloat(numberOfRows))
        return itemHeight
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(testCards) { card in
            Text(card.content)
                .cardify(color: Color.green, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
        }
    }
}
