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
    
    var move : [TicTacToeMove]!
    
    override func setUp() {
        super.setUp()
        
        let position = CGPoint(x: 0, y: 0)
        move = [
            TicTacToeMove(position: position, weight: 10),
            TicTacToeMove(position: position, weight: 0),
            TicTacToeMove(position: position, weight: -10)
        ]
    }
    
    override func tearDown() {
        super.tearDown()
        
        //TODO: Does this actaully clean up the objects
        move = nil
    }
    
    
    func testComparable() {
        let min = move.min()
        XCTAssertTrue(min?.weight == -10)
        
        let max = move.max()
        XCTAssertTrue(max?.weight == 10)
    }
}
