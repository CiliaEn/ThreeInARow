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
    
    init() {
        board = [[CellState]](repeating: [CellState](repeating: .empty, count: 3), count: 3)
        player1 = Player(name: "Player 1", symbol: "X")
        player2 = Player(name: "Player 2", symbol: "O")
    }
    
    func placeSymbol(symbol: String, atRow row: Int, column: Int) {
        // Place the symbol on the board
    }
    
   /* func isGameOver() -> Bool {
        // Check if the game is over
    }
 */
}


