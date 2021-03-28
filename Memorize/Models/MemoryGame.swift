//
//  MemoryGame.swift
//  Memorize
//
//  Created by Donato Aguirre on 9/3/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

struct MemoryGame {
    private(set) var cards: [Card]
    private(set) var score: Int

    init(numberOfPairs: Int, cardContentFactory: (Int) -> String) {
        cards = []
        score = 0

        for pairIndex in 0 ..< numberOfPairs {
            let cardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }

        cards.shuffle()
    }

    mutating func updateScore(firstSelectedCardIndex: Int, secondSelectedCardIndex: Int) {
        if cards[firstSelectedCardIndex].content == cards[secondSelectedCardIndex].content {
            score += 2
        } else {
            if cards[firstSelectedCardIndex].hasAlreadyBeenSeen {
                score -= 1
            }
            if cards[secondSelectedCardIndex].hasAlreadyBeenSeen {
                score -= 1
            }
        }
    }

    mutating func choose(_ card: Card) {
        let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp }

        // 3rd tap: two cards are opened, update there seen status and flip them
        if faceUpCardsIndices.count == 2 {
            for index in cards.indices where cards[index].isFaceUp {
                cards[index].hasAlreadyBeenSeen = true
                cards[index].isFaceUp = false
            }
        }

        if
            let chosenIndex = cards.firstIndex(matching: card),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            // 1st tap: choose card -> flip the 1st card
            cards[chosenIndex].isFaceUp = true

            // 2nd tap: choose another card -> flip the 2nd card
            if faceUpCardsIndices.count == 1 {
                if cards[faceUpCardsIndices[0]].content == cards[chosenIndex].content {
                    cards[faceUpCardsIndices[0]].isMatched = true
                    cards[chosenIndex].isMatched = true
                }

                updateScore(
                    firstSelectedCardIndex: faceUpCardsIndices[0],
                    secondSelectedCardIndex: chosenIndex
                )
            }
        }
    }
}
