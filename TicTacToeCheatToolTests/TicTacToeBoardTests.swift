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
        
        board = TicTacToeBoard(size: TicTacToeCell(row: 3, column: 3))
    }
    
    override func tearDown() {
        super.tearDown()
        
        board = nil
    }
    
    func testEmptycells() {
        var emptycells = board.emptyPositions
        XCTAssertTrue(emptycells.count == 9)
        
        var value = board.getValue(cell: TicTacToeCell(row: 0, column: 0))
        XCTAssertTrue(value == TicTacToeValue.empty)
        
        var firstEmptycell = emptycells[0];
        XCTAssertTrue(firstEmptycell.x == 0 && firstEmptycell.y == 0)
        
        board.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 0, column: 0))
        emptycells = board.emptycells()
        XCTAssertTrue(emptycells.count == 8)
        
        firstEmptycell = emptycells[0];
        XCTAssertTrue(firstEmptycell.x == 0 && firstEmptycell.y == 1)
        
        value = board.getValue(cell: TicTacToeCell(row: 0, column: 0))
        XCTAssertTrue(value == TicTacToeValue.X)
    }
    
    func testHorizontalWin() {
        for y in (0..<board.getColumnCount()) {
            board.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 1, column: y))
        }
        board.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 0, column:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testVerticalWin() {
        for x in (0..<board.getRowCount()) {
            board.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: x, column: 1))
        }
        board.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 0, column:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testForwardDiagonalWin() {
        for (x, y) in zip((0..<board.getRowCount()), (0..<board.getColumnCount())) {
            board.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: x, column: y))
        }
        board.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 0, column:2))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
    
    func testBackwardDiagonalWin() {
        for (x, y) in zip((0..<board.getRowCount()), (0..<board.getColumnCount()).reversed()) {
            board.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: x, column: y))
        }
        board.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 0, column:0))
        
        let winner = board.hasWinner()
        XCTAssertTrue(winner == TicTacToeValue.X)
    }
}
