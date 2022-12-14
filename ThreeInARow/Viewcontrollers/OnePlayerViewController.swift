//
//  OnePlayerViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-09.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    
    let onePlayerGameSegueId = "onePlayerGameSegue"
    
    var player1Name : String?
    var player2Name : String?
    
    var gameMode = "easy"
    
    @IBOutlet var player1TextField: UITextField!
    
    @IBOutlet var easyButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func easyButtonTapped(_ sender: UIButton) {
        gameMode = "easy"
    }
    
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        gameMode = "medium"
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        gameMode = "hard"
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startPlayingTapped(_ sender: UIButton) {
        
        if let p1Name = player1TextField.text {
            player1Name = p1Name
        }
        performSegue(withIdentifier: onePlayerGameSegueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == onePlayerGameSegueId {
            if let destinationVC = segue.destination as? GameViewController  {
                destinationVC.p1Name = player1Name
                destinationVC.p2Name = "Computer"
                destinationVC.onePlayerMode = true
                destinationVC.gameMode = gameMode
            }
        }
    }
}
