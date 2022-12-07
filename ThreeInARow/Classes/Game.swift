//
//  Game.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-06.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import Foundation

class Game {
    
    var player1: Player
    var player2: Player
    
    let board : [[Game.CellState]]
    
    enum CellState {
        case empty
        case player1
        case player2
    }
    
    init(player1: Player, player2: Player) {
        board = [[CellState]](repeating: [CellState](repeating: .empty, count: 3), count: 3)
        self.player1 = player1
        self.player2 = player2
    }
    
    func placeSymbol(symbol: String, atRow row: Int, column: Int) {
        // Place the symbol on the board
    }
    
   /* func isGameOver() -> Bool {
        // Check if the game is over
    }
 */
}


