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
    
    @IBOutlet var player1TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startPlayingTapped(_ sender: UIButton) {
        
        if let p1Name = player1TextField.text {
            player1Name = p1Name
        }
        player2Name = "Computer"
        performSegue(withIdentifier: onePlayerGameSegueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == onePlayerGameSegueId {
            if let destinationVC = segue.destination as? GameViewController  {
                destinationVC.p1Name = player1Name
                destinationVC.p2Name = player2Name
                destinationVC.onePlayerMode = true
            }
        }
    }
}
