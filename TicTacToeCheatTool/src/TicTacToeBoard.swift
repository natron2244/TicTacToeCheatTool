//
//  TicTacToeBoard.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

//TODO: Look at using custom because CGPoint has float and Int only
//TODO: Look at using gaurds
struct TicTacToeBoard {
    var board:[[TicTacToeValue]];
    
    init(size: CGSize) {
        board = Array(repeating: Array(repeating: TicTacToeValue.empty, count: Int(size.width)), count: Int(size.height))
    }
    
    //TODO: Check out of bounds
    mutating func set(value: TicTacToeValue, position: CGPoint) {
        self.board[Int(position.x)][Int(position.y)] = value
    }
    
    //TODO: Check out of bounds
    func getValue(position: CGPoint) -> TicTacToeValue {
        return self.board[Int(position.x)][Int(position.y)]
    }
    
    func getRowCount() -> Int {
        return board.count
    }
    
    func getColumnCount() -> Int {
        return board[0].count
    }
    /*
     - returns: If a player as won, if neither empty
     */
    func hasWinner() -> TicTacToeValue {
        var winner = checkHorizontalWin()
        if(winner != TicTacToeValue.empty) {
            return winner
        }
        
        winner = checkVerticalWin()
        if(winner != TicTacToeValue.empty) {
            return winner
        }
        
        winner = checkDiagonalWin()
        return winner
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkHorizontalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty;
        
        for rows in self.board {
            var currentWinner = TicTacToeValue.empty
            for value in rows {
                if(value == TicTacToeValue.empty) {
                    currentWinner = TicTacToeValue.empty;
                    break;
                } else if(currentWinner == TicTacToeValue.empty) {
                    currentWinner = value
                } else if(currentWinner != value) {
                    currentWinner = TicTacToeValue.empty
                    break
                }
            }
            
            if(currentWinner != TicTacToeValue.empty) {
                winner = currentWinner
                break
            }
        }
        
        return winner
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkVerticalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty;
        
        for column in 0..<getColumnCount() {
            var currentWinner = TicTacToeValue.empty
            for row in board {
                let value = row[column];
                if(value == TicTacToeValue.empty) {
                    currentWinner = TicTacToeValue.empty;
                    break;
                } else if(currentWinner == TicTacToeValue.empty) {
                    currentWinner = value
                } else if(currentWinner != value) {
                    currentWinner = TicTacToeValue.empty
                    break
                }
            }
            
            if(currentWinner != TicTacToeValue.empty) {
                winner = currentWinner
                break
            }
        }
        
        return winner
    }
    
    /*
     - returns: If a player as won, if neither empty
     */
    func checkDiagonalWin() -> TicTacToeValue {
        var forwardDiagonalWinner = checkForwardDiagonalWin()
        if(forwardDiagonalWinner != TicTacToeValue.empty) {
            return forwardDiagonalWinner;
        } else {
            return checkBackwardDiagonalWin()
        }
    }
    
    func checkForwardDiagonalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty
        for (x, y) in zip((0..<getRowCount()), (0..<getColumnCount())) {
            let value = self.board[x][y]
            
            if(value == TicTacToeValue.empty) {
                winner = TicTacToeValue.empty;
                break;
            } else if(winner == TicTacToeValue.empty) {
                winner = value
            } else if(winner != value) {
                winner = TicTacToeValue.empty
                break
            }
        }
        return winner;
    }
    
    func checkBackwardDiagonalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty
        for (x, y) in zip((0..<getRowCount()), (0..<getColumnCount()).reversed()) {
            let value = self.board[x][y]
            
            if(value == TicTacToeValue.empty) {
                winner = TicTacToeValue.empty;
                break;
            } else if(winner == TicTacToeValue.empty) {
                winner = value
            } else if(winner != value) {
                winner = TicTacToeValue.empty
                break
            }
        }
        return winner
    }
    
    
    
    func emptyPositions() -> [CGPoint] {
        var emptyPositions: [CGPoint] = []
        for x in 0..<getRowCount() {
            for y in 0..<getColumnCount() {
                if(self.board[x][y] == TicTacToeValue.empty) {
                    emptyPositions.append(CGPoint(x: x, y: y))
                }
            }
        }
        return emptyPositions
    }
}
