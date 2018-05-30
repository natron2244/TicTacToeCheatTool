//
//  TicTacToeBoard.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

// TODO: Look at using custom because CGPoint has float and Int only
struct TicTacToeBoard {
    var board:[[TicTacToeValues]];
    
    init(size: CGSize) {
        board = Array(repeating: Array(repeating: TicTacToeValues.empty, count: Int(size.width)), count: Int(size.height))
    }
    
    mutating func set(value: TicTacToeValues, position: CGPoint) {
        self.board[Int(position.x)][Int(position.y)] = value
    }
    
    func getValue(position: CGPoint) -> TicTacToeValues {
        return self.board[Int(position.x)][Int(position.y)]
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func hasWinner() -> TicTacToeValues {
        var winner = checkHorizontalWin()
        if(winner != TicTacToeValues.empty) {
            return winner
        }
        
        winner = checkVerticalWin()
        if(winner != TicTacToeValues.empty) {
            return winner
        }
        
        winner = checkDiagonalWin()
        return winner
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkHorizontalWin() -> TicTacToeValues {
        //TODO
        return TicTacToeValues.empty
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkVerticalWin() -> TicTacToeValues {
        //TODO
        return TicTacToeValues.empty
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkDiagonalWin() -> TicTacToeValues {
        //TODO
        return TicTacToeValues.empty
    }
    
    func emptyPositions() -> [CGPoint] {
        var emptyPositions: [CGPoint] = []
        for x in 0...self.board.count - 1 {
            for y in 0...self.board[x].count - 1 {
                if(self.board[x][y] == TicTacToeValues.empty) {
                    emptyPositions.append(CGPoint(x: x, y: y))
                }
            }
        }
        return emptyPositions
    }
}
