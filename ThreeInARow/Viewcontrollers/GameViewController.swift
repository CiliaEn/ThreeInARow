//
//  GameViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-07.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var p1 : Player?
    var p2 : Player?
    var p1Name = "Player 1"
    var p2Name = "Player 2"
    var p1Score : Int = 0
    var p2Score : Int = 0
    let game = Game()
    let firstTurn = Turn.p1
    var currentTurn = Turn.p1
    
    let CIRCLE = "O"
    let CROSS = "X"
    var listOfButtons = [UIButton]()
    
    enum Turn {
        case p1
        case p2
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

        if let player1 = p1 {
            p1Name = player1.name
            player1Label.text = "\(p1Name): 0"
            turnLabel.text = "\(p1Name) make your move!"
            
            if let player2 = p2 {
                p2Name = player2.name
                player2Label.text = "\(p2Name): 0"
            }
        }
        setTagsForButtons()
        setListOfButtons()
        
    }
    
    func setTagsForButtons() {
        a1.tag = 00
        a2.tag = 01
        a3.tag = 02
        b1.tag = 10
        b2.tag = 11
        b3.tag = 12
        c1.tag = 20
        c2.tag = 21
        c3.tag = 22
    }
    
    func setListOfButtons() {
        listOfButtons.append(a1)
        listOfButtons.append(a2)
        listOfButtons.append(a3)
        listOfButtons.append(b1)
        listOfButtons.append(b2)
        listOfButtons.append(b3)
        listOfButtons.append(c1)
        listOfButtons.append(c2)
        listOfButtons.append(c3)
    }
    
    @IBAction func boardButtonTapped(_ sender: UIButton) {
        
        placeToken(sender)
        
        //check if someone has won
        if (game.checkForWin(CIRCLE)){
            turnLabel.text = "\(p1Name) won! \nPress to play again"
            p1Score += 1
            //start a new game
        } else if (game.checkForWin(CROSS)){
            turnLabel.text = "\(p2Name) won! \nPress to play again"
            p2Score += 1
            //start a new game
        } else if(game.boardIsFull()){
            turnLabel.text = "It's a tie! \nPress to play again"
            //start a new game
        }
    }
    
    func placeToken(_ sender: UIButton){
        
        //checks if place is empty
        if(sender.title(for: .normal) == nil){
            
            if (currentTurn == Turn.p1){
                sender.setTitle(CIRCLE, for: .normal)
                
                game.placeToken(CIRCLE, sender.tag)
                currentTurn = Turn.p2
                turnLabel.text = "\(p2Name) make your move!"
            } else if (currentTurn == Turn.p2){
                sender.setTitle(CROSS, for: .normal)
                game.placeToken(CROSS, sender.tag)
                currentTurn = Turn.p1
                turnLabel.text = "\(p1Name) make your move!"
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
