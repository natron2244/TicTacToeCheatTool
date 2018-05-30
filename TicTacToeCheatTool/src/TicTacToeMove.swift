//
//  TicTacToeMove.swift
//  TicTacToeCheatTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation
import UIKit

struct TicTacToeMove: Comparable {
    var position: CGPoint;
    var weight: Int;
    
    init(position: CGPoint, weight: Int) {
        self.position = position;
        self.weight = weight;
    }
    
    static func < (firstMove: TicTacToeMove, secondMove: TicTacToeMove) -> Bool {
        return firstMove.weight < secondMove.weight;
    }
    
    static func == (firstMove: TicTacToeMove, secondMove: TicTacToeMove) -> Bool {
        return firstMove.weight == secondMove.weight;
    }
}
