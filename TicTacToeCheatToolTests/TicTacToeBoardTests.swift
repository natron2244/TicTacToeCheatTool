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
        XCTAssertTrue(value == TicTacToeValue.empty)
        
        var firstEmptyPosition = emptyPositions[0];
        XCTAssertTrue(firstEmptyPosition.x == 0 && firstEmptyPosition.y == 0)
        
        board.set(value: TicTacToeValue.X, position: CGPoint(x: 0, y: 0))
        emptyPositions = board.emptyPositions()
        XCTAssertTrue(emptyPositions.count == 8)
        
        firstEmptyPosition = emptyPositions[0];
        XCTAssertTrue(firstEmptyPosition.x == 0 && firstEmptyPosition.y == 1)
        
        value = board.getValue(position: CGPoint(x: 0, y: 0))
        XCTAssertTrue(value == TicTacToeValue.X)
    }
    
    func testHorizontalWin() {
        for y in (0..<board.getColumnCount()) {
            board.set(value: TicTacToeValue.X, position: CGPoint(x: 1, y: y))
        }
        board.set(value: TicTacToeValue.O, position: CGPoint(x: 0, y:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testVerticalWin() {
        for x in (0..<board.getRowCount()) {
            board.set(value: TicTacToeValue.X, position: CGPoint(x: x, y: 1))
        }
        board.set(value: TicTacToeValue.O, position: CGPoint(x: 0, y:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testForwardDiagonalWin() {
        for (x, y) in zip((0..<board.getRowCount()), (0..<board.getColumnCount())) {
            board.set(value: TicTacToeValue.X, position: CGPoint(x: x, y: y))
        }
        board.set(value: TicTacToeValue.O, position: CGPoint(x: 0, y:2))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testBackwardDiagonalWin() {
        for (x, y) in zip((0..<board.getRowCount()), (0..<board.getColumnCount()).reversed()) {
            board.set(value: TicTacToeValue.X, position: CGPoint(x: x, y: y))
        }
        board.set(value: TicTacToeValue.O, position: CGPoint(x: 0, y:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
}
