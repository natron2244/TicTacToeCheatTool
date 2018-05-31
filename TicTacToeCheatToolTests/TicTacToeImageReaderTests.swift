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
        
        imageReader = TicTacToeImageReader(boardSize: TicTacToeCell(row: 3, column: 3), cellSize: CGSize(width: 50, height: 50))
    }
    
    override func tearDown() {
        super.tearDown()
        
        imageReader = nil;
    }
    
    func testGetTicTacToeBoard() {
        let lastRect = imageReader.getImageRect(cell: TicTacToeCell(row: 2, column: 2))
        XCTAssertTrue(lastRect.equalTo(CGRect(x: 100, y: 100, width: 50, height: 50)))
    }
}
