//
//  TwoPlayerViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-07.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {
    
    let twoPlayerGameSegueId = "twoPlayerGameSegue"

    @IBOutlet var player1TextField: UITextField!
    @IBOutlet var player2TextField: UITextField!
    
    var player1 : Player?
    var player2 : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        if let player1Name = player1TextField.text {
            player1 = Player(name: player1Name, token: "O", score: 0)
            print("1")
        }
        if let player2Name = player2TextField.text {
            player2 = Player(name: player2Name, token: "X", score: 0)
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == twoPlayerGameSegueId {
            if let destinationVC = segue.destination as? GameViewController  {
                print("2")
                destinationVC.p1 = player1
                destinationVC.p2 = player2
            }
        }
    }
    

}
