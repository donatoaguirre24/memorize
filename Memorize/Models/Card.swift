//
//  Card.swift
//  memorize
//
//  Created by Donato Aguirre on 24/12/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    var hasAlreadyBeenSeen = false
    var isFaceUp = false
    var isMatched = false
    var content: String
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
}

let testCards = [
    Card(isFaceUp: true, content: "A"),
    Card(isFaceUp: false, content: "B"),
    Card(isFaceUp: false, content: "C"),
    Card(isFaceUp: true, content: "D"),
]
