//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Donato Aguirre on 8/30/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var game: MemoryGameViewModel

    var body: some View {
        NavigationView {
            Grid(game.cards) { card in
                CardView(card: card, color: game.theme.color)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
            .navigationBarTitle("memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("score \(game.score)")
                        .foregroundColor(game.theme.color)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("new_game", action: game.resetGame)
                }
            }
        }
        .accentColor(game.theme.color)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(game: MemoryGameViewModel())
    }
}
