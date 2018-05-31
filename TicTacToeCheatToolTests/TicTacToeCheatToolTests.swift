//
//  TicTacToeCheatToolTests.swift
//  TicTacToeCheatToolTests
//
//  Created by Nathan Christensen on 2018-05-30.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import XCTest
@testable import TicTacToeCheatTool

//TODO: Add preformance test to see where best to make optimizations
class TicTacToeCheatToolTests: XCTestCase {
    
    var cheatTool: TicTacToeCheatTool!
    
    override func setUp() {
        super.setUp()
        
        let imageReader = TicTacToeImageReader(boardSize: TicTacToeCell(row: 3, column: 3),
                                               cellSize: CGSize(width: 50, height: 50))
        cheatTool = TicTacToeCheatTool(imageReader: imageReader)
    }
    
    override func tearDown() {
        super.tearDown()
        
        cheatTool = nil
    }
    
    func testNoMoveAvailable() {
        var fullBoard = TicTacToeBoard(size: TicTacToeCell(row: 1, column: 1))
        fullBoard.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 0, column: 0))
        
        let nextMove = cheatTool.getNextBestMove(board: fullBoard, player: TicTacToeValue.O)
        XCTAssertNil(nextMove)
    }
    
    func testOneMoveAvailable() {
        let fullBoard = TicTacToeBoard(size: TicTacToeCell(row: 1, column: 1))
        
        let nextMove = cheatTool.getNextBestMove(board: fullBoard, player: TicTacToeValue.O)
        XCTAssertNotNil(nextMove)
        XCTAssertTrue(nextMove?.row == 0 && nextMove?.column == 0)
    }
    
    func testEmptyBoard() {
        let emptyBoard = TicTacToeBoard(size: TicTacToeCell(row: 3, column: 3))
        
        let nextMove = cheatTool.getNextBestMove(board: emptyBoard, player: TicTacToeValue.X)
        XCTAssertNotNil(nextMove)
        XCTAssertTrue(nextMove?.row == 0 && nextMove?.column == 0)
    }
    
    func testWinningMoveOverBlocklingOppenent() {
        var aboutToWinBoard = TicTacToeBoard(size: TicTacToeCell(row: 3, column: 3))
        aboutToWinBoard.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 0, column: 0))
        aboutToWinBoard.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 0, column: 1))
        
        aboutToWinBoard.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 2, column: 0))
        aboutToWinBoard.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 2, column: 1))
        
        let nextMove = cheatTool.getNextBestMove(board: aboutToWinBoard, player: TicTacToeValue.X)
        XCTAssertNotNil(nextMove)
        XCTAssertTrue(nextMove?.row == 0 && nextMove?.column == 2)
    }
    
    func testBlocklingOppenent() {
        var aboutToWinBoard = TicTacToeBoard(size: TicTacToeCell(row: 3, column: 3))
        aboutToWinBoard.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 0, column: 0))
        aboutToWinBoard.set(value: TicTacToeValue.X, cell: TicTacToeCell(row: 2, column: 2))
        
        aboutToWinBoard.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 0, column: 2))
        aboutToWinBoard.set(value: TicTacToeValue.O, cell: TicTacToeCell(row: 1, column: 1))
        
        let nextMove = cheatTool.getNextBestMove(board: aboutToWinBoard, player: TicTacToeValue.X)
        XCTAssertNotNil(nextMove)
        XCTAssertTrue(nextMove?.row == 2 && nextMove?.column == 0)
    }
}
