//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Cilia Ence on 2022-11-30.
//  Copyright © 2022 Cilia Ence. All rights reserved.
//

import UIKit


//A first comment 2022-11-30

class ViewController: UIViewController {
    
    let onePlayerSegueId = "onePlayerSegue"
    let twoPlayerSegueId = "twoPlayerSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func onePlayer(_ sender: UIButton) {
        performSegue(withIdentifier: onePlayerSegueId, sender: self)
    }
    
    @IBAction func twoPlayer(_ sender: UIButton) {
        
       performSegue(withIdentifier: twoPlayerSegueId, sender: self)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

