//
//  TicTacToeImageReaderTests.swift
//  TicTacToeCheatToolTests
//
//  Created by Nathan Christensen on 2018-05-30.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import XCTest

class TicTacToeImageReaderTests: XCTestCase {
    
    var imageReader: TicTacToeImageReader!
    
    override func setUp() {
        super.setUp()
        
        imageReader = TicTacToeImageReader(boardSize: CGSize(width: 3, height: 3), cellSize: CGSize(width: 50, height: 50))
    }
    
    override func tearDown() {
        super.tearDown()
        
        imageReader = nil;
    }
    
    func testGetTicTacToeBoard() {
        let board = imageReader.getTicTacToeBoard();
        XCTAssertTrue(board.getValue(position: CGPoint(x: 0, y: 0)) == TicTacToeValue.O)
        XCTAssertTrue(board.getValue(position: CGPoint(x: 2, y: 2)) == TicTacToeValue.O)
        
    }
}
