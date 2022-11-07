//
//  MemoryGame.swift
//  Memorize
//
//  Created by Donato Aguirre on 9/3/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

struct MemoryGame {
    private(set) var cards: [Card] = []
    private(set) var score = 0

    init(numberOfPairs: Int, cardContentFactory: (Int) -> String) {
        (0..<numberOfPairs).forEach { pairIndex in
            let card = Card(content: cardContentFactory(pairIndex))
            cards += [card, card]
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp }

        // 3rd tap: two cards are opened, update there seen status and flip them
        if faceUpCardsIndices.count == 2 {
            faceUpCardsIndices.forEach { index in
                cards[index].hasAlreadyBeenSeen = true
                cards[index].isFaceUp = false
            }
        }

        guard let chosenCardIndex = cards.firstIndex(matching: card),
              !cards[chosenCardIndex].isFaceUp && !cards[chosenCardIndex].isMatched
        else {
            return
        }

        // 1st tap: choose card -> flip the 1st card
        cards[chosenCardIndex].isFaceUp = true

        // 2nd tap: choose another card -> flip the 2nd card
        if faceUpCardsIndices.count == 1 {
            let faceUpCardIndex = faceUpCardsIndices[0]

            if cards[faceUpCardIndex] == cards[chosenCardIndex] {
                cards[faceUpCardIndex].isMatched = true
                cards[chosenCardIndex].isMatched = true
            }

            updateScore(firstCard: cards[faceUpCardIndex], secondCard: cards[chosenCardIndex])
        }
    }

    private mutating func updateScore(firstCard: Card, secondCard: Card) {
        let pointsPerMatch = 2
        let pointsPerError = -1

        if firstCard == secondCard {
            score += pointsPerMatch
        } else {
            if firstCard.hasAlreadyBeenSeen {
                score += pointsPerError
            }
            if secondCard.hasAlreadyBeenSeen {
                score += pointsPerError
            }
        }
    }
}
