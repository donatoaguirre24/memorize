//
//  MemorizeTests.swift
//  MemorizeTests
//
//  Created by Donato Aguirre on 13/1/21.
//  Copyright © 2021 Donato Aguirre. All rights reserved.
//

import XCTest
@testable import Memorize

class MemorizeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameInitialState() throws {
        let game = MemoryGameViewModel()

        XCTAssertTrue(game.cards.count > 0, "Should start with a collection of cards")

        game.cards.forEach { card in
            XCTAssertTrue(card.isFaceUp == false, "All cards should start face down")
        }
    }
}
