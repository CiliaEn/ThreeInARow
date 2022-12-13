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
    var gameMode : String?
    var mode = ""
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
        if let gameMode = gameMode {
            mode = gameMode
        }
        addButtonTags()
        addButtonsToList()
        turnLabel.isUserInteractionEnabled = false
    }
    
    func addButtonTags() {
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
    
    func addButtonsToList() {
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
        makeMove(sender)
    }
    
    func makeMove(_ sender: UIButton){
        
        //checks if pane is empty
        if(sender.title(for: .normal) == nil){
            
            if (currentTurn == Turn.p1){
                placeToken(sender, p1.token)
                currentTurn = Turn.p2
                setTurnLabel(p2)
                checkIfGameIsOver()
                
                //makes move for the computer if it's oneplayer-mode
                if onePlayerMode != nil {
                    if (game.isOver == false){
                        makeMoveForPC()
                        checkIfGameIsOver()
                    }
                }
                
            } else if (currentTurn == Turn.p2){
                placeToken(sender, p2.token)
                currentTurn = Turn.p1
                setTurnLabel(p1)
                checkIfGameIsOver()
            }
        }
    }
    
    //make move for the computer
    func makeMoveForPC(){
        
        //make new list of all the free spaces
        var freeSpaces = [UIButton]()
        
        for button in listOfButtons {
            if(button.title(for: .normal) == nil){
                freeSpaces.append(button)
            }
        }
        //pane to play if computer can win
        let paneToPlay = game.paneToPlay(p2.token)
        
        //pane to block if p1 has two in a row
        let paneToBlock = game.paneToPlay(p1.token)
        
        if (mode == "hard" && paneToPlay != -1){
            for freeSpace in freeSpaces{
                if(freeSpace.tag == paneToPlay){
                    placeToken(freeSpace, p2.token)
                }
            }
        } else if (mode == "medium" || mode == "hard" && paneToBlock != -1) {
            for freeSpace in freeSpaces{
                if(freeSpace.tag == paneToBlock){
                    placeToken(freeSpace, p2.token)
                }
            }
        } else {
            let randomIndex = Int(arc4random_uniform(UInt32(freeSpaces.count)))
            let randomButton = freeSpaces[randomIndex]
            placeToken(randomButton, p2.token)
        }
        currentTurn = Turn.p1
        setTurnLabel(p1)
    }
    
    func placeToken(_ button : UIButton, _ token : String){
        button.setTitle(token, for: .normal)
        game.placeToken(token, button.tag)
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





