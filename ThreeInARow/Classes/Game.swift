//
//  Game.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-06.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import Foundation

class Game {
    
//    var player1: Player
//    var player2: Player
    var CIRCLE = "O"
    var CROSS = "X"
    
    enum Turn {
        case player1
        case player2
    }
    
    
//    init(player1: Player, player2: Player) {
//        self.player1 = player1
//        self.player2 = player2
//    }
    
    func randomizeFirstTurn() -> Turn {

        if (arc4random_uniform(2) + 1 == 1) {
            return Turn.player1
        }
        return Turn.player2

    }
    
//    func placeSymbol(_ sender: UIButton) {
//
//        if(sender.title == ""){
//
//            if (currentTurn == Turn.player1){
//                sender.setTitle(CIRCLE)
//                currentTurn
//            }
//        }
//    }
    
   /* func isGameOver() -> Bool {
        // Check if the game is over
    }
 */
}


