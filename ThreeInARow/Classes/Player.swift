//
//  Player.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-06.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import Foundation

class Player {
    
    let name: String
    let token: String
    var score: Int
    
    init(_ name: String, token: String, score: Int) {
        self.name = name
        self.token = token
        self.score = score
    }
}

