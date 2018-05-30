//
//  TicTacToeImageReader.swift
//  TicTacToeCheatingTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

struct TicTacToeImageReader {
    var boardSize: CGSize
    var cellSize: CGSize
    
    init(boardSize: CGSize, cellSize: CGSize) {
        //Number of rows and columns
        self.boardSize = boardSize
        //Pixil size of each cell width and height
        self.cellSize = cellSize
    }
    
    func getTicTacToeBoard(/*boardImage: UIImage,*/) -> TicTacToeBoard {
        var board = TicTacToeBoard(size: self.boardSize)
        
        //TODO: Check if off by one
        for x in 0...Int(self.boardSize.width - 1) {
            for y in 0...Int(self.boardSize.height - 1) {
                let position = CGPoint(x: x, y: y)
                let value = getBoardValue(/*boardImage: boardImage,*/ position: position)
                board.set(value: value, position: position)
            }
        }
        return board
    }
    
    func getBoardValue(/*boardImage: UIImage,*/ position: CGPoint) -> TicTacToeValues {
        
        let imageRect = getImageRect(position: position)
        for value in TicTacToeValues.allValues {
            //--- Pseudocode ---
            //TODO: Need image matching library here to match images.
            //var valueImage = getImageForValue(value)
            //if(boardImage.contains(image: valueImage, inRect: imageRect)
            //{
            return value;
            //}
        }
        
        return TicTacToeValues.empty
    }
    
    func getImageRect(position: CGPoint) -> CGRect {
        let rect = CGRect(x: position.x,
                          y: position.y,
                          width: position.x + self.cellSize.width,
                          height: position.y + self.cellSize.height)
        return rect
    }
}