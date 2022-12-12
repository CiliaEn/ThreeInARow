//
//  GameViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-07.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var p1Name : String?
    var p2Name : String?
    
    var p1 = Player("", token: "", score: 0)
    var p2 = Player("", token: "", score: 0)
    
    var firstTurn = Turn.p1
    var currentTurn = Turn.p1
    var game = Game()
    var onePlayerMode : Bool?
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
        
        if let player1Name = p1Name {
            p1 = Player(player1Name, token: "O", score: 0)
            player1Label.text = "\(p1.name): \(p1.score)"
            setTurnLabel(p1)
        }
        if let player2Name = p2Name {
            p2 = Player(player2Name, token: "X", score: 0)
            player2Label.text = "\(p2.name): \(p2.score)"
        }
        setTagsForButtons()
        setListOfButtons()
        turnLabel.isUserInteractionEnabled = false
    }
    
    func setTagsForButtons() {
        a1.tag = 0
        a2.tag = 1
        a3.tag = 2
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
    }
    
    func placeToken(_ sender: UIButton){
        
        //checks if place is empty
        if(sender.title(for: .normal) == nil){
            
            if (currentTurn == Turn.p1){
                sender.setTitle(p1.token, for: .normal)
                game.placeToken(p1.token, sender.tag)
                currentTurn = Turn.p2
                setTurnLabel(p2)
                checkIfGameIsOver()
                
                
             if onePlayerMode != nil {
                    if (game.isOver == false){
                            makeMove()
                            checkIfGameIsOver()
                        }
                    }
                
            } else if (currentTurn == Turn.p2){
                sender.setTitle(p2.token, for: .normal)
                game.placeToken(p2.token, sender.tag)
                currentTurn = Turn.p1
                setTurnLabel(p1)
                checkIfGameIsOver()
            }
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        
        if(game.isOver){
            resetBoard()
            turnLabel.isUserInteractionEnabled = false
            setFirstTurn()
        }
    }
    
    func setTurnLabel(_ player : Player){
        turnLabel.text = "\(player.name) make your move!"
    }
    
    func checkIfGameIsOver() {
        
        //check if someone has won
        if (game.checkForWin(p1.token)){
            disableBoard()
            turnLabel.text = "\(p1.name) won! Press to play again!"
            p1.score += 1
            player1Label.text = "\(p1.name): \(p1.score)"
        } else if (game.checkForWin(p2.token)){
            disableBoard()
            turnLabel.text = "\(p2.name) won! Press to play again!"
            p2.score += 1
            player2Label.text = "\(p2.name): \(p2.score)"
        }
            //Check if its a tie
        else if(game.boardIsFull()){
            turnLabel.text = "It's a tie! Press to play again!"
            turnLabel.isUserInteractionEnabled = true
        }
    }
    
    //make move for the computer
    func makeMove(){
        
        //make new list of all the free spaces
        var freeSpaces = [UIButton]()
        
        for button in listOfButtons {
            
            if(button.title(for: .normal) == nil){
                freeSpaces.append(button)
            }
        }
        //prevent p1 from winning
        
        let spaceToBlock = game.spaceToBlock(p1.token)
        
        if (spaceToBlock != -1){
            for freeSpace in freeSpaces{
                if(freeSpace.tag == spaceToBlock){
                    freeSpace.setTitle(p2.token, for: .normal)
                    game.placeToken(p2.token, freeSpace.tag)
                }
            }
        } else {
            //random button
            let randomIndex = Int(arc4random_uniform(UInt32(freeSpaces.count)))
            let randomButton = freeSpaces[randomIndex]
            randomButton.setTitle(p2.token, for: .normal)
            game.placeToken(p2.token, randomButton.tag)
        }
        currentTurn = Turn.p1
        setTurnLabel(p1)
    }
   
    func setFirstTurn() {
        
        if (firstTurn == Turn.p1){
            if onePlayerMode == nil{
                firstTurn = Turn.p2
                currentTurn = Turn.p2
                setTurnLabel(p2)
            }
            currentTurn = Turn.p1
            setTurnLabel(p1)
        } else{
            firstTurn = Turn.p1
            currentTurn = Turn.p1
            setTurnLabel(p1)
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
        game.isOver = true
        turnLabel.isUserInteractionEnabled = true
    }
}





