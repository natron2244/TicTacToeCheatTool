//
//  TicTacToeCheatTool.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

struct TicTacToeCheatTool {
    var imageReader: TicTacToeImageReader
    
    init(imageReader: TicTacToeImageReader) {
        self.imageReader = imageReader
    }
    
    //TODO: UIImage should be optional as it is need to find the mext move, done so method can be tested
    func getNextBestMove(boardImage: UIImage?, player: TicTacToeValue) -> TicTacToeCell? {
        let board = imageReader.getTicTacToeBoard(boardImage: boardImage)
        return getNextBestMove(board: board, player: player)
    }
    
    func getNextBestMove(board: TicTacToeBoard, player: TicTacToeValue) -> TicTacToeCell? {
        //Need a valid player
        if(player == TicTacToeValue.empty) {
            assertionFailure("No player entered, can't find next move")
            return nil
        }
        
        let emptyPositions = board.emptyPositions()
        if(emptyPositions.isEmpty ||
            board.hasWinner() != TicTacToeValue.empty) {
            return nil
        } else if(emptyPositions.count == 1) {
            return emptyPositions.first
        } else {
            let bestMove = calculateNextBestMove(board: board, targetPlayer: player, currentPlayer: player)
            return bestMove.move
        }
    }
    
    //This fuction process the next best move
    func calculateNextBestMove(board: TicTacToeBoard, targetPlayer: TicTacToeValue, currentPlayer: TicTacToeValue) -> TicTacToeMove{
        let emptyPositions = board.emptyPositions()
        let winner = board.hasWinner()
        
        if(winner == targetPlayer) {
            return TicTacToeMove(move: TicTacToeCell.invalidCell(),
                                 weight: TicTacToeTerminalState.Win)
        } else if(winner == TicTacToeValue.getOpponent(player: targetPlayer)) {
            return TicTacToeMove(move: TicTacToeCell.invalidCell(),
                                 weight: TicTacToeTerminalState.Lose)
        } else if(emptyPositions.isEmpty) {
            return TicTacToeMove(move: TicTacToeCell.invalidCell(),
                                 weight: TicTacToeTerminalState.Tie)
        }
        
        var moves: [TicTacToeMove] = []
        for emptyCell in emptyPositions {
            var nextTurnBoard = board;
            nextTurnBoard.set(value: currentPlayer, cell: emptyCell)
            
            let nextMove = calculateNextBestMove(board: nextTurnBoard,
                                                 targetPlayer: targetPlayer,
                                                 currentPlayer: TicTacToeValue.getOpponent(player: currentPlayer))
            
            let move = TicTacToeMove(move: emptyCell, weight: nextMove.weight)
            moves.append(move)
        }
        
        let bestMove = currentPlayer == targetPlayer ? moves.max()! : moves.min()!
        return bestMove
    }
}

struct TicTacToeMove: Comparable {
    var move: TicTacToeCell
    var weight: TicTacToeTerminalState
    
    init(move: TicTacToeCell, weight: TicTacToeTerminalState) {
        self.move = move
        self.weight = weight
    }
    
    static func < (firstMove: TicTacToeMove, secondMove: TicTacToeMove) -> Bool {
        return firstMove.weight.rawValue < secondMove.weight.rawValue
    }
    
    static func == (firstMove: TicTacToeMove, secondMove: TicTacToeMove) -> Bool {
        return firstMove.weight.rawValue == secondMove.weight.rawValue
    }
}

enum TicTacToeTerminalState: Int {
    case Win = 10, Lose = -10, Tie = 0
}

