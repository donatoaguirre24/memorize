//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Donato Aguirre on 9/3/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

final class MemoryGameViewModel: ObservableObject {
    // MARK: - Access to the Model

    @Published private var game: MemoryGame
    var theme: Theme
    var cards: [Card] { game.cards }
    var score: Int { game.score }

    init() {
        theme = themes.randomElement()!
        game = Self.createMemoryGame(with: theme)
    }

    // MARK: - Intents

    func choose(_ card: Card) {
        game.choose(card)
    }

    func resetGame() {
        theme = themes.randomElement()!
        game = Self.createMemoryGame(with: theme)
    }
}

private extension MemoryGameViewModel {
    static func createMemoryGame(with theme: Theme) -> MemoryGame {
        let emojis = theme.emojis.shuffled()
        let numberOfPairs = Int.random(in: 2 ... emojis.count)
        return MemoryGame(numberOfPairs: numberOfPairs) { emojis[$0] }
    }
}
