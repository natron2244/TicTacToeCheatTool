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
    var boardSize: TicTacToeCell
    var cellSize: CGSize
    
    init(boardSize: TicTacToeCell, cellSize: CGSize) {
        self.boardSize = boardSize
        self.cellSize = cellSize
    }
    
    func getTicTacToeBoard(boardImage: UIImage?) -> TicTacToeBoard {
        var board = TicTacToeBoard(size: self.boardSize)
        
        for row in 0..<self.boardSize.row {
            for column in 0..<self.boardSize.column {
                let cell = TicTacToeCell(row: row, column: column)
                let value = getBoardValue(boardImage: boardImage, cell: cell)
                board.set(value: value, cell: cell)
            }
        }
        return board
    }
    
    func getBoardValue(boardImage: UIImage?, cell: TicTacToeCell) -> TicTacToeValue {
        
        let imageRect = getImageRect(cell: cell)
        for value in TicTacToeValue.allValues {
            //--- Pseudocode ---
            //TODO: Need image matching library here to match images.
            //var valueImage = getImageForValue(value)
            //if(boardImage.contains(image: valueImage, inRect: imageRect)
            //{
            //return value;
            //}
            print("Looking for \(value) in \(NSStringFromCGRect(imageRect))")
        }
        
        return TicTacToeValue.empty
    }
    
    func getImageRect(cell: TicTacToeCell) -> CGRect {
        let x = CGFloat(cell.row) * self.cellSize.width;
        let y = CGFloat(cell.column) * self.cellSize.height;
        
        let rect = CGRect(x: x,
                          y: y,
                          width: self.cellSize.width,
                          height: self.cellSize.height)
        return rect
    }
}
