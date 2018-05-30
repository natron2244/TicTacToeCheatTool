//
//  TicTacToeCheatToolTests.swift
//  TicTacToeCheatToolTests
//
//  Created by Nathan Christensen on 2018-05-30.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import XCTest
@testable import TicTacToeCheatTool

class TicTacToeCheatToolTests: XCTestCase {
    
    var cheatTool: TicTacToeCheatTool!
    
    override func setUp() {
        super.setUp()
        
        let imageReader = TicTacToeImageReader(boardSize: CGSize(width: 3, height: 3),
                                               cellSize: CGSize(width: 50, height: 50))
        cheatTool = TicTacToeCheatTool(imageReader: imageReader)
    }
    
    override func tearDown() {
        super.tearDown()
        
        cheatTool = nil
    }
    
    func testNoMoveAvailable() {
        var fullBoard = TicTacToeBoard(size: CGSize(width: 1, height: 1))
        fullBoard.set(value: TicTacToeValue.X, position: CGPoint(x: 0, y: 0))
        
        let nextMoves = cheatTool.getNextBestMoves(board: fullBoard, player: TicTacToeValue.O)
        XCTAssertTrue(nextMoves.isEmpty)
    }
    
    func testOneMoveAvailable() {
        let fullBoard = TicTacToeBoard(size: CGSize(width: 1, height: 1))
        
        let nextMoves = cheatTool.getNextBestMoves(board: fullBoard, player: TicTacToeValue.O)
        XCTAssertTrue(nextMoves.count == 1)
        XCTAssertTrue(nextMoves[0].x == 0 && nextMoves[0].y == 0)
    }
    
    func testWinningMoveOverBlocklingOppenent() {
        var aboutToWinBoard = TicTacToeBoard(size: CGSize(width: 3, height: 3))
        aboutToWinBoard.set(value: TicTacToeValue.X, position: CGPoint(x: 0, y: 0))
        aboutToWinBoard.set(value: TicTacToeValue.X, position: CGPoint(x: 0, y: 1))
        
        aboutToWinBoard.set(value: TicTacToeValue.O, position: CGPoint(x: 2, y: 0))
        aboutToWinBoard.set(value: TicTacToeValue.O, position: CGPoint(x: 2, y: 1))
        
        let nextMoves = cheatTool.getNextBestMoves(board: aboutToWinBoard, player: TicTacToeValue.X)
        XCTAssertTrue(nextMoves.count == 1)
        XCTAssertTrue(nextMoves[0].x == 0 && nextMoves[0].y == 2)
    }
}
