//
//  TicTacToeCheatTool.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

//TODO: Write out restrictions of the code base
//TODO: Any need comments on re-reader
//TODO: Look for any unneed ;
//TODO: Remove unneed type checks
//TODO: Spelling check
//TODO: Re-visit file division
//TODO: Actaully allow upload of a board and return next move

struct TicTacToeCheatTool {
    var imageReader: TicTacToeImageReader
    
    init(imageReader: TicTacToeImageReader) {
        self.imageReader = imageReader
    }
    
    func getNextBestMove(boardImage: UIImage?, player: TicTacToeValue) -> TicTacToeCell? {
        //TODO: Pass image in currently set to optional
        let board: TicTacToeBoard = imageReader.getTicTacToeBoard(boardImage: boardImage)
        return getNextBestMove(board: board, player: player)
    }
    
    func getNextBestMove(board: TicTacToeBoard, player: TicTacToeValue) -> TicTacToeCell? {
        //Need a valid player
        if(player == TicTacToeValue.empty) {
            return nil
        }
        
        let emptyPositions = board.emptyPositions()
        if(emptyPositions.isEmpty ||
            board.hasWinner() != TicTacToeValue.empty) {
            return nil
        } else if(emptyPositions.count == 1) {
            return emptyPositions.first;
        } else {
            let bestMove = calculateNextBestMove(board: board, targetPlayer: player, currentPlayer: player)
            return bestMove?.move
        }
    }
    
    //This fuction process the next best move
    func calculateNextBestMove(board: TicTacToeBoard, targetPlayer: TicTacToeValue, currentPlayer: TicTacToeValue) -> TicTacToeMove?{
        let emptyPositions = board.emptyPositions()
        let winner = board.hasWinner()

        if(winner == targetPlayer) {
            return TicTacToeMove(move: TicTacToeCell(row: 0, column: 0),
                                 weight: 10)
        } else if(winner == TicTacToeValue.getOpponent(player: targetPlayer)) {
            return TicTacToeMove(move: TicTacToeCell(row: 0, column: 0),
                                 weight: -10)
        } else if(emptyPositions.isEmpty) {
            return TicTacToeMove(move: TicTacToeCell(row: 0, column: 0),
                                 weight: 0)
        }

        var moves: [TicTacToeMove] = [];
        for emptyCell in emptyPositions {
            var nextTurnBoard = TicTacToeBoard(board: board)
            nextTurnBoard.set(value: currentPlayer, cell: emptyCell)

            let nextMove = calculateNextBestMove(board: nextTurnBoard,
                                                 targetPlayer: targetPlayer,
                                                 currentPlayer: TicTacToeValue.getOpponent(player: currentPlayer))
            
            let move = TicTacToeMove(move: emptyCell, weight: nextMove!.weight)
            moves.append(move)
        }

        let bestMove = currentPlayer == targetPlayer ? moves.max()! : moves.min()!
        return bestMove
    }

}

