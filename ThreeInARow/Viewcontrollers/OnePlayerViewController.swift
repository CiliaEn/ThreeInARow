//
//  OnePlayerViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-12-09.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    
    let newGameSegueId = "onePlayerGameSegue"
    
    @IBOutlet var player1TextField: UITextField!
    
    var player1 : Player?
    var player2 : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startPlayingTapped(_ sender: UIButton) {
        
        if let player1Name = player1TextField.text {
            print("1")
            player1 = Player(name: player1Name, token: "O", score: 0)
        }
        print("1.5")
        player2 = Player(name: "Computer", token: "X", score: 0)
        
        performSegue(withIdentifier: newGameSegueId, sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == newGameSegueId {
            if let destinationVC = segue.destination as? GameViewController  {
                
                destinationVC.p1 = player1
                print("2")
                destinationVC.p2 = player2
                destinationVC.onePlayerMode = true
            }
        }
    }
    

}
