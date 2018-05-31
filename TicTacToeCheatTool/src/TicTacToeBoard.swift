//
//  TicTacToeBoard.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

//TODO: Look at using gaurds
//TODO: Refactor winning logic to use function, they are all simular logic
struct TicTacToeBoard {
    var board:[[TicTacToeValue]];
    let size: TicTacToeCell;
    
    init(size: TicTacToeCell) {
        self.size = size
        self.board = Array(repeating: Array(repeating: TicTacToeValue.empty, count: size.row), count: size.column)
    }
    
    //TODO: Optimize to only init the two dimensional array only once
    init(board: TicTacToeBoard) {
        let size = TicTacToeCell(row: board.getRowCount(), column: board.getColumnCount())
        self.init(size: size);
        
        for row in 0..<size.row {
            for column in 0..<size.column {
                self.board[row][column] = board.board[row][column]
            }
        }
    }
    
    //TODO: Check out of bounds
    mutating func set(value: TicTacToeValue, cell: TicTacToeCell) {
        self.board[cell.row][cell.column] = value
    }
    
    //TODO: Check out of bounds
    func getValue(cell: TicTacToeCell) -> TicTacToeValue {
        return self.board[cell.row][cell.column]
    }
    
    func getRowCount() -> Int {
        return self.size.row
    }
    
    func getColumnCount() -> Int {
        return self.size.column
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
        let forwardDiagonalWinner = checkForwardDiagonalWin()
        if(forwardDiagonalWinner != TicTacToeValue.empty) {
            return forwardDiagonalWinner;
        } else {
            return checkBackwardDiagonalWin()
        }
    }
    
    func checkForwardDiagonalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty
        for (row, column) in zip((0..<getRowCount()), (0..<getColumnCount())) {
            let value = self.board[row][column]
            
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
        for (row, column) in zip((0..<getRowCount()), (0..<getColumnCount()).reversed()) {
            let value = self.board[row][column]
            
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
    
    
    
    func emptyPositions() -> [TicTacToeCell] {
        var emptyPositions: [TicTacToeCell] = []
        for row in 0..<getRowCount() {
            for column in 0..<getColumnCount() {
                if(self.board[row][column] == TicTacToeValue.empty) {
                    emptyPositions.append(TicTacToeCell(row: row, column: column))
                }
            }
        }
        return emptyPositions
    }
}
