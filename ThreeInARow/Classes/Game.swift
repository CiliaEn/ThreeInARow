//
//  Game.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-06.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import Foundation

class Game {
 
    var board = [  ["", "", ""],
                   ["", "", ""],
                   ["", "", ""]
    ]
    
    func placeToken(_ token : String, _ xy : Int) {

        let x = xy / 10
        let y = xy - (x * 10)
        print("\(x)\(y)")
        board[x][y] = token
        
    }
    func boardIsFull() -> Bool {
        
        for row in board {
            for space in row {
                if (space.isEmpty){
                    return false
                }
            }
        }
        //returns true if there are still free spaces
        return true
    }
    
    func checkForWin(_ s: String) -> Bool {
        
        //Checks if someone has won horizontally
        for i in 0..<3 {
            
            if (space(0, i, contains: s) && space(1, i, contains: s) && space(2, i, contains: s)){
                return true
            }
        }
        //Checks if someone has won vertically
        for i in 0..<3 {
            
            if (space(i, 0, contains: s) && space(i, 1, contains: s) && space(i, 2, contains: s)){
                return true
            }
        }
        //Checks if someone has won diagonally
        if (space(0, 0, contains: s) && space(1, 1, contains: s) && space(2, 2, contains: s)){
            return true
        }
        if (space(0, 2, contains: s) && space(1, 1, contains: s) && space(2, 0, contains: s)){
            return true
        }
        return false
    }
    
    func space(_ x: Int, _ y : Int, contains token: String) -> Bool {
        
        if(board[x][y] == token){
            return true
        }
        return false
    }
}


