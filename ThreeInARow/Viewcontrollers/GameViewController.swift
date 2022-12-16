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
    var p1 = Player("Player 1", token: "O", score: 0)
    var p2 = Player("Player 2", token: "X", score: 0)
    
    var firstTurn = Turn.p1
    var currentTurn = Turn.p1
    var game = Game()
    var onePlayerMode : Bool?
    var onePlayer = false
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
            if(!player1Name.isEmpty){
                p1 = Player(player1Name, token: "O", score: 0)
            }
        }
        player1Label.text = "\(p1.name): \(p1.score)"
        setTurn(p1, Turn.p1)
        
        if let player2Name = p2Name {
            if (!player2Name.isEmpty){
                p2 = Player(player2Name, token: "X", score: 0)
            }
        }
        player2Label.text = "\(p2.name): \(p2.score)"
        
        if let gameMode = gameMode {
            mode = gameMode
        }
        if let oneP = onePlayerMode {
            onePlayer = oneP
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
                setTurn(p2, Turn.p2)
                checkIfGameIsOver()
                
                //makes move for the computer if it's oneplayer-mode
                if onePlayer {
                    if (game.isOver == false){
                        makeMoveForPC()
                        setTurn(p1, Turn.p1)
                        checkIfGameIsOver()
                    }
                }
            } else if (currentTurn == Turn.p2){
                placeToken(sender, p2.token)
                setTurn(p1, Turn.p1)
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
        let paneToPlay = game.hasTwoInARow(p2.token)
        
        //pane to block if p1 has two in a row
        let paneToBlock = game.hasTwoInARow(p1.token)
        
        if (mode == "hard" && paneToPlay != -1){
            for freeSpace in freeSpaces{
                if(freeSpace.tag == paneToPlay){
                    placeToken(freeSpace, p2.token)
                }
            }
        } else if (mode == "medium" && paneToBlock != -1 || mode == "hard" && paneToBlock != -1) {
                for freeSpace in freeSpaces{
                    if(freeSpace.tag == paneToBlock){
                        placeToken(freeSpace, p2.token)
                    }
                }
        }else {
            let randomIndex = Int(arc4random_uniform(UInt32(freeSpaces.count)))
            let randomButton = freeSpaces[randomIndex]
            placeToken(randomButton, p2.token)
        }
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
            print("R")
        }
    }
    
    func setTurn(_ player : Player, _ turn : Turn){
        currentTurn = turn
        turnLabel.text = "\(player.name) make your move!"
        print("E")
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
        //check if its a tie
        else if(game.boardIsFull()){
            turnLabel.text = "It's a tie! Press to play again!"
            turnLabel.isUserInteractionEnabled = true
        }
    }
    
    func setFirstTurn() {
        
        if (firstTurn == Turn.p1){
            print("q")
            if onePlayer == false {
                print("w")
                firstTurn = Turn.p2
                setTurn(p2, Turn.p2)
            }else{
                setTurn(p1, Turn.p1)
            }
        } else{
            firstTurn = Turn.p1
            setTurn(p1, Turn.p1)
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
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}





