//
//  TicTacToeCheatTool.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

//TODO: Test logic use a TicTacToeBoard, UnitTesting?
//TODO: Uncomment UImage varibles
//TODO: Write out restrictions of the code base
//TODO: Any need comments on re-reader
//TODO: Look for any unneed ;
//TODO: Remove unneed type checks
//TODO: Spelling check
//TODO: Re-visit file division
//TODO: Actaully allow upload of a board and return next move

struct TicTacToeCheatTool {
    var imageReader: TicTacToeImageReader
    
    init(imageReader: TicTacToeImageReader, boardSize: CGSize, cellSize: CGSize) {
        self.imageReader = imageReader
    }
    
    /*
     Gets an array CGPoints of best possible moves given the board.
     Note: The top-left is x:0, y:0
     - returns: An array of CGPoint, empty is there is not best next move. For example some one has already won the game.
     */
    func getNextBestMoves(/*boardImage: UIImage, */ player: TicTacToeValues) -> [CGPoint] {
        let board: TicTacToeBoard = imageReader.getTicTacToeBoard(/*boardImage: boardImage,*/)
        return getNextBestMoves(board: board, player: player)
    }
    
    func getNextBestMoves(board: TicTacToeBoard, player: TicTacToeValues) -> [CGPoint] {
        //Need a valid player
        if(player == TicTacToeValues.empty) {
            return []
        }
        
        let emptyPositions = board.emptyPositions()
        if(emptyPositions.isEmpty ||
            board.hasWinner() != TicTacToeValues.empty) {
            return [];
        }
        
        
        //TODO: Implement weighted move recursive function that steps through all steps of possible moves for both players. A min max algorithm
        
        
        return []
    }
    
    //This fuction process the next best move
    func minimax(board: TicTacToeBoard, player: TicTacToeValues) {
        
    }
}

