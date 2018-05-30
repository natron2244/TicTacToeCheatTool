//
//  TicTacToeValues.swift
//  TicTacToeCheatTool
//
//  Created by Nathan Christensen on 2018-05-29.
//  Copyright © 2018 Nathan Christensen. All rights reserved.
//

import Foundation

enum TicTacToeValue: String {
    case X = "X", O = "O", empty = ""
    
    static let allValues = [X, O, empty];
    
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
