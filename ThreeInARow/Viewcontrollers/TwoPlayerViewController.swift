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
    
    var player1Name : String?
    var player2Name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        if let p1Name = player1TextField.text {
            player1Name = p1Name
        }
        if let p2Name = player2TextField.text {
            player2Name = p2Name
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == twoPlayerGameSegueId {
            if let destinationVC = segue.destination as? GameViewController  {
                destinationVC.p1Name = player1Name
                destinationVC.p2Name = player2Name
            }
        }
    }
}
