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
    
    var isOver = false
    
    func placeToken(_ token : String, _ xy : Int) {
        
        let x = xy / 10
        let y = xy - (x * 10)
        //print("\(x)\(y)")
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
        //returns true if board is full
        isOver = true
        return true
    }
    
    func checkForWin(_ s: String) -> Bool {
        
        //Checks if someone has won horizontally
        for i in 0..<3 {
            
            if (space(0, i, contains: s) && space(1, i, contains: s) && space(2, i, contains: s)){
                isOver = true
                return true
            }
        }
        //Checks if someone has won vertically
        for i in 0..<3 {
            
            if (space(i, 0, contains: s) && space(i, 1, contains: s) && space(i, 2, contains: s)){
                isOver = true
                return true
            }
        }
        //Checks if someone has won diagonally
        if (space(0, 0, contains: s) && space(1, 1, contains: s) && space(2, 2, contains: s)){
            isOver = true
            return true
        }
        if (space(0, 2, contains: s) && space(1, 1, contains: s) && space(2, 0, contains: s)){
            isOver = true
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
    
    func spaceToBlock(_ s: String) -> Int {
        
        //Checks if someone has 2 horizontally
        for i in 0..<3 {
            
            if (space(1, i, contains: s) && space(2, i, contains: s)){
                if (board[0][i].isEmpty) {
                    return 0 + i
                }
            }
            if (space(0, i, contains: s) && space(2, i, contains: s)){
                if (board[1][i].isEmpty) {
                    return 10 + i
                }
                
            }
            if (space(0, i, contains: s) && space(1, i, contains: s)){
                if (board[2][i].isEmpty) {
                    return 20 + i
                }
            }
        }
        //Checks if someone has 2 vertically
        for i in 0..<3 {
            
            if (space(i, 1, contains: s) && space(i, 2, contains: s)){
                if (board[i][0].isEmpty){
                    return i * 10
                }
            }
            if (space(i, 0, contains: s) && space(i, 2, contains: s)){
                if (board[i][1].isEmpty){
                    return i * 10 + 1
                }
            }
            if (space(i, 0, contains: s) && space(i, 1, contains: s)){
                if (board[i][2].isEmpty){
                    return i * 10 + 2
                }
            }
        }
        //Checks if someone has 2 diagonally
        if (space(0, 0, contains: s) && space(1, 1, contains: s)){
            if (board[2][2].isEmpty){
                return 22
            }
        }
        if (space(2, 2, contains: s) && space(0, 0, contains: s))
            || (space(0, 2, contains: s) && space(2, 0, contains: s)){
            if (board[1][1].isEmpty){
                return 11
            }
        }
        if (space(1, 1, contains: s) && space(2, 2, contains: s)) {
            if (board[0][0].isEmpty){
                return 0
            }
        }
        if (space(0, 2, contains: s) && space(1, 1, contains: s)){
            if (board[2][0].isEmpty){
                return 20
            }
        }
        if (space(2, 0, contains: s) && space(1, 1, contains: s)){
            if (board[0][2].isEmpty){
                return 2
            }
        }
        return -1
    }
}


