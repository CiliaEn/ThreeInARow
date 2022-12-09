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
    var game = Game()
    let firstTurn = Turn.p1
    var currentTurn = Turn.p1
    var onePlayerMode : Bool?
    
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
        
        if let oneplayer = onePlayerMode {
            print("\(oneplayer)")
        }

        if let player1 = p1 {
            p1Name = player1.name
            print("\(p1Name)")
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
            disableBoard()
            turnLabel.text = "\(p1Name) won! Press to play again!"
            p1Score += 1
            player1Label.text = "\(p1Name): \(p1Score)"
        } else if (game.checkForWin(CROSS)){
            disableBoard()
            turnLabel.text = "\(p2Name) won! Press to play again!"
            p2Score += 1
            player2Label.text = "\(p2Name): \(p2Score)"
        }
        //Check if its a tie
        else if(game.boardIsFull()){
            turnLabel.text = "It's a tie! Press to play again!"
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
                
                if let onePlayer = onePlayerMode {
                    
                    if(onePlayer){
                        //make move for the computer
                        //can be changed to a random
                        
                        var done = false
                        
                        for button in listOfButtons {
                            
                            if (done == false){
                            if(button.title(for: .normal) == nil){
                                button.setTitle(CROSS, for: .normal)
                                game.placeToken(CROSS, button.tag)
                                currentTurn = Turn.p1
                                turnLabel.text = "\(p1Name) make your move!"
                                done = true
                            }
                            }
                        }
                    }
                    
                }
                
            } else if (currentTurn == Turn.p2){
                    sender.setTitle(CROSS, for: .normal)
                    game.placeToken(CROSS, sender.tag)
                currentTurn = Turn.p1
                turnLabel.text = "\(p1Name) make your move!"
                }
            
            
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        
        if(game.isOver){
            resetBoard()
        }
    }
    
    func resetBoard(){
        for button in listOfButtons {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        game = Game()
    }
    
    func disableBoard(){
        for button in listOfButtons {
            button.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}





