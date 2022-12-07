//
//  GameViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-07.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var player1 : Player?
    var player2 : Player?
    var game : Game?
    
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!
    @IBOutlet var turnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let player1 = player1 {
            player1Label.text = "\(player1.name): 0"
            turnLabel.text = "\(player1.name) make your move!"
            
            if let player2 = player2 {
                player2Label.text = "\(player2.name): 0"
                
                game = Game(player1: player1, player2: player2)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
