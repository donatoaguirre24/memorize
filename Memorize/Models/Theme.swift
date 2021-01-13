//
//  Theme.swift
//  memorize
//
//  Created by Donato Aguirre on 9/17/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct Theme {
    var emojis: [String]
    var color: Color
}

let themes = [
    Theme(emojis: ["🐶", "🦁", "🐷", "🐯", "🐼", "🐰"], color: .blue),
    Theme(emojis: ["😸", "😹", "😻", "🙀", "😾", "😼"], color: .red),
    Theme(emojis: ["😸", "😹", "😻", "🙀", "😾", "😼"], color: .red),
    Theme(emojis: ["👻", "🎃", "🕷", "💀", "🧟‍♂️", "🧛🏻‍♂️"], color: .orange),
    Theme(emojis: ["🌷", "🌺", "🌹", "🌸", "🌼", "💐"], color: .pink),
    Theme(emojis: ["🤖", "👾", "🦾", "🦿", "🎮", "🖲"], color: .purple),
    Theme(emojis: ["🥦", "🍅", "🌽", "🥕", "🥒", "🍆"], color: .green),
]
