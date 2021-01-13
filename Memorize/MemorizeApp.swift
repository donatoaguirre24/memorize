//
//  memorizeApp.swift
//  memorize
//
//  Created by Donato Aguirre on 13/10/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var game = MemoryGameViewModel()

    var body: some Scene {
        WindowGroup {
            MemoryGameView(game: game)
        }
    }
}
