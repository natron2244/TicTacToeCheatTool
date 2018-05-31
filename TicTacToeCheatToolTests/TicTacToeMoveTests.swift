//
//  TicTacToeMoveTests.swift
//  TicTacToeCheatToolTests
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import XCTest
@testable import TicTacToeCheatTool

class TicTacToeMoveTests: XCTestCase {
    
    var move: [TicTacToeMove]!
    
    override func setUp() {
        super.setUp()
        
        let cell = TicTacToeCell(row: 0, column: 0)
        move = [
            TicTacToeMove(move: cell, weight: TicTacToeTerminalState.Win),
            TicTacToeMove(move: cell, weight: TicTacToeTerminalState.Tie),
            TicTacToeMove(move: cell, weight: TicTacToeTerminalState.Lose)
        ]
    }
    
    override func tearDown() {
        super.tearDown()
        
        move = nil
    }
    
    
    func testComparable() {
        let min = move.min()
        XCTAssertTrue(min?.weight == TicTacToeTerminalState.Lose)
        
        let max = move.max()
        XCTAssertTrue(max?.weight == TicTacToeTerminalState.Win)
    }
}
