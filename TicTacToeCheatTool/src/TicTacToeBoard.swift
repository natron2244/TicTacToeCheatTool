//
//  TicTacToeBoard.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation

//TODO: Refactor winning logic to use function, they are all simular logic
struct TicTacToeBoard {
    var board:[[TicTacToeValue]]
    let size: TicTacToeCell
    
    init(size: TicTacToeCell) {
        self.size = size
        self.board = Array(repeating: Array(repeating: TicTacToeValue.empty, count: size.row), count: size.column)
    }
    
    mutating func set(value: TicTacToeValue, cell: TicTacToeCell) {
        guard cell.row < rowCount() else {
            assertionFailure("Try to set out of bounds row: \(cell.row)")
            return
        }
        guard cell.column < columnCount() else {
            assertionFailure("Try to set out of bounds column: \(cell.column)")
            return
        }
        
        self.board[cell.row][cell.column] = value
    }
    
    func getValue(cell: TicTacToeCell) -> TicTacToeValue {
        guard cell.row < rowCount() else {
            assertionFailure("Try to get out of bounds row: \(cell.row)")
            return TicTacToeValue.empty
        }
        guard cell.column < columnCount() else {
            assertionFailure("Try to get out of bounds column: \(cell.column)")
            return TicTacToeValue.empty
        }
        
        return self.board[cell.row][cell.column]
    }
    
    func rowCount() -> Int {
        return self.size.row
    }
    
    func columnCount() -> Int {
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
        var winner = TicTacToeValue.empty
        
        for rows in self.board {
            var currentWinner = TicTacToeValue.empty
            for value in rows {
                if(value == TicTacToeValue.empty) {
                    currentWinner = TicTacToeValue.empty
                    break
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
        var winner = TicTacToeValue.empty
        
        for column in 0..<columnCount() {
            var currentWinner = TicTacToeValue.empty
            for row in board {
                let value = row[column]
                if(value == TicTacToeValue.empty) {
                    currentWinner = TicTacToeValue.empty
                    break
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
            return forwardDiagonalWinner
        } else {
            return checkBackwardDiagonalWin()
        }
    }
    
    func checkForwardDiagonalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty
        for (row, column) in zip((0..<rowCount()), (0..<columnCount())) {
            let value = self.board[row][column]
            
            if(value == TicTacToeValue.empty) {
                winner = TicTacToeValue.empty
                break
            } else if(winner == TicTacToeValue.empty) {
                winner = value
            } else if(winner != value) {
                winner = TicTacToeValue.empty
                break
            }
        }
        return winner
    }
    
    func checkBackwardDiagonalWin() -> TicTacToeValue {
        var winner = TicTacToeValue.empty
        for (row, column) in zip((0..<rowCount()), (0..<columnCount()).reversed()) {
            let value = self.board[row][column]
            
            if(value == TicTacToeValue.empty) {
                winner = TicTacToeValue.empty
                break
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
        for row in 0..<rowCount() {
            for column in 0..<columnCount() {
                if(self.board[row][column] == TicTacToeValue.empty) {
                    emptyPositions.append(TicTacToeCell(row: row, column: column))
                }
            }
        }
        return emptyPositions
    }
}

struct TicTacToeCell {
    var row: Int
    var column: Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
    
    static func invalidCell() -> TicTacToeCell {
        return TicTacToeCell(row: -1, column: -1)
    }
}

enum TicTacToeValue: String {
    case X = "X", O = "O", empty = ""
    
    static let allValues = [X, O, empty]
    
    static func getOpponent(player: TicTacToeValue) -> TicTacToeValue {
        switch player {
        case .X:
            return TicTacToeValue.O
        case .O:
            return TicTacToeValue.X
        default:
            return TicTacToeValue.empty
        }
    }
}
