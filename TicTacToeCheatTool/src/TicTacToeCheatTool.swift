//
//  TicTacToeCheatTool.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

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
            return [];
        } else if(emptyPositions.count == 1) {
            return emptyPositions;
        } else {
            //TODO: Implement weighted move recursive function that steps through all steps of possible moves for both players. A min max algorithm
            return calculateNextBestMoves(board: board, player: player, emptyPositions: emptyPositions)
        }
    }
    
    //This fuction process the next best move
    func calculateNextBestMoves(board: TicTacToeBoard, player: TicTacToeValue, emptyPositions: [CGPoint]) -> [CGPoint]{
        return [CGPoint(x: 1, y: 1)]
    }
}

