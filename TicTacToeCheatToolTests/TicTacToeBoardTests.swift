//
//  TicTacToeBoardTests.swift
//  TicTacToeCheatToolTests
//
//  Created by Nathan Christensen on 2018-05-30.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import XCTest
@testable import TicTacToeCheatTool

class TicTacToeBoardTests: XCTestCase {
    var board: TicTacToeBoard!
    
    override func setUp() {
        super.setUp()
        
        board = TicTacToeBoard(size: CGSize(width: 3, height: 3))
    }
    
    override func tearDown() {
        super.tearDown()
        
        board = nil
    }
    
    func testEmptyPositions() {
        var emptyPositions = board.emptyPositions()
        XCTAssertTrue(emptyPositions.count == 9)
        
        var value = board.getValue(position: CGPoint(x: 0, y: 0))
        XCTAssertTrue(value == TicTacToeValues.empty)
        
        var firstEmptyPosition = emptyPositions[0];
        XCTAssertTrue(firstEmptyPosition.x == 0 && firstEmptyPosition.y == 0)
        
        board.set(value: TicTacToeValues.X, position: CGPoint(x: 0, y: 0))
        emptyPositions = board.emptyPositions()
        XCTAssertTrue(emptyPositions.count == 8)
        
        firstEmptyPosition = emptyPositions[0];
        XCTAssertTrue(firstEmptyPosition.x == 0 && firstEmptyPosition.y == 1)
        
        value = board.getValue(position: CGPoint(x: 0, y: 0))
        XCTAssertTrue(value == TicTacToeValues.X)
    }
}
