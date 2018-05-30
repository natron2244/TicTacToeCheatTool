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
    //Dada, Moma & Runa
    
    override func setUp() {
        super.setUp()
        
        imageReader = TicTacToeImageReader(boardSize: CGSize(width: 3, height: 3), cellSize: CGSize(width: 50, height: 50))
    }
    
    override func tearDown() {
        super.tearDown()
        
        imageReader = nil;
    }
}
