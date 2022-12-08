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
    let game = Game()
    let firstTurn = Turn.player1
    var currentTurn = Turn.player1
    
    let CIRCLE = "O"
    let CROSS = "X"
    
    enum Turn {
        case player1
        case player2
    }
    
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!
    @IBOutlet var turnLabel: UILabel!
    
    @IBOutlet var a1: UIButton!
    @IBOutlet var a2: UIButton!
    @IBOutlet var a3: UIButton!
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var c1: UIButton!
    @IBOutlet var c2: UIButton!
    @IBOutlet var c3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let player1 = player1 {
            player1Label.text = "\(player1.name): 0"
            turnLabel.text = "\(player1.name) make your move!"
            
            if let player2 = player2 {
                player2Label.text = "\(player2.name): 0"
            }
        }
       // currentTurn = game.randomizeFirstTurn()
        
    }
    
    
    @IBAction func boardButtonTapped(_ sender: UIButton) {
        placeSymbol(sender)
    }
    
    func placeSymbol(_ sender: UIButton){
        
        if(sender.title(for: .normal) == nil){
            
            if (currentTurn == Turn.player1){
                sender.setTitle(CIRCLE, for: .normal)
                currentTurn = Turn.player2
                turnLabel.text = "\(player2!.name) make your move!"
            } else if (currentTurn == Turn.player2){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.player1
                turnLabel.text = "\(player1!.name) make your move!"
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
