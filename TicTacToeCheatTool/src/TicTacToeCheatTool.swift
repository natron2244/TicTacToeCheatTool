//
//  TicTacToeCheatTool.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

//TODO: Use optionals for null checking
//TODO: Only pass back one move, if even just choose the first
//TODO: Set private and public methods
//TODO: Test logic use a TicTacToeBoard, UnitTesting?
//TODO: Uncomment UImage varibles
//TODO: Add a row and column struct to replace CGPoint
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
    
    /*
     Gets an array CGPoints of best possible moves given the board.
     Note: The top-left is x:0, y:0
     - returns: An array of CGPoint, empty is there is not best next move. For example some one has already won the game.
     */
    func getNextBestMoves(/*boardImage: UIImage, */ player: TicTacToeValue) -> [CGPoint] {
        let board: TicTacToeBoard = imageReader.getTicTacToeBoard(/*boardImage: boardImage,*/)
        return getNextBestMoves(board: board, player: player)
    }
    
    func getNextBestMoves(board: TicTacToeBoard, player: TicTacToeValue) -> [CGPoint] {
        //Need a valid player
        if(player == TicTacToeValue.empty) {
            return []
        }
        
        let emptyPositions = board.emptyPositions()
        if(emptyPositions.isEmpty ||
            board.hasWinner() != TicTacToeValue.empty) {
            return []
        } else if(emptyPositions.count == 1) {
            return emptyPositions;
        } else {
            //TODO: Refactor weighted recursive function that steps through all steps of possible moves for both players. A min max algorithm
            let bestMoves = calculateNextBestMoves(board: board, targetPlayer: player, currentPlayer: player)
            return [bestMoves[0].position]
        }
    }
    
    //This fuction process the next best move
    func calculateNextBestMoves(board: TicTacToeBoard, targetPlayer: TicTacToeValue, currentPlayer: TicTacToeValue) -> [TicTacToeMove]{
        let emptyPositions = board.emptyPositions()
        let winner = board.hasWinner()

        if(winner == targetPlayer) {
            return [TicTacToeMove(position: CGPoint(x: 0, y: 0), weight: 10)]
        } else if(winner == TicTacToeValue.getOpponent(player: targetPlayer)) {
            return [TicTacToeMove(position: CGPoint(x: 0, y: 0), weight: -10)]
        } else if(emptyPositions.isEmpty) {
            return [TicTacToeMove(position: CGPoint(x: 0, y: 0), weight: 0)]
        }

        var moves: [TicTacToeMove] = [];
        for position in emptyPositions {
            var nextTurnBoard = TicTacToeBoard(board: board)
            nextTurnBoard.set(value: currentPlayer, position: position)

            var nextMove = calculateNextBestMoves(board: nextTurnBoard,
                                                  targetPlayer: targetPlayer,
                                                  currentPlayer: TicTacToeValue.getOpponent(player: currentPlayer))
            
            //TODO: Use optional here instead of 0 index
            let move = TicTacToeMove(position: position, weight: nextMove[0].weight)
            moves.append(move)
        }

        let bestMove = currentPlayer == targetPlayer ? moves.max()! : moves.min()!
        return [bestMove]
    }

}

