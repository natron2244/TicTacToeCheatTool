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
        for x in 0..<Int(self.boardSize.width) {
            for y in 0..<Int(self.boardSize.height) {
                let position = CGPoint(x: x, y: y)
                let value = getBoardValue(/*boardImage: boardImage,*/ position: position)
                board.set(value: value, position: position)
            }
        }
        return board
    }
    
    func getBoardValue(/*boardImage: UIImage,*/ position: CGPoint) -> TicTacToeValue {
        
        let imageRect = getImageRect(position: position)
        for value in TicTacToeValue.allValues {
            //--- Pseudocode ---
            //TODO: Need image matching library here to match images.
            //var valueImage = getImageForValue(value)
            //if(boardImage.contains(image: valueImage, inRect: imageRect)
            //{
            //return value;
            //}
            print(value)
        }
        
        return TicTacToeValue.O
    }
    
    func getImageRect(position: CGPoint) -> CGRect {
        let x = position.x * self.cellSize.width;
        let y = position.y * self.cellSize.height;
        
        let rect = CGRect(x: x,
                          y: y,
                          width: self.cellSize.width,
                          height: self.cellSize.height)
        return rect
    }
}
