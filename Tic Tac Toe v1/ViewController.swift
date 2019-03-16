//
//  ViewController.swift
//  Tic Tac Toe v1
//
//  Created by Allan Shivji on 3/15/19.
//  Copyright © 2019 Allan Shivji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {
    
    
    @IBOutlet weak var playerXField: UITextField!
    
    @IBOutlet weak var playerYField: UITextField!
    
    @IBAction func startGameButton(_ sender: Any) {
    }
    
    @IBOutlet weak var declareLabel: UILabel!
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if playerXField.text == "" || playerYField.text == "" {
            declareLabel.text = "Enter 2 player names"
            declareLabel.textColor = UIColor.red
            
            return false
            
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let secondGameViewController = segue.destination as! SecondGameViewController
            
            let storeNamesX = playerXField.text!
            let storeNamesY = playerYField.text!
            
            secondGameViewController.xPlayer = storeNamesX
            secondGameViewController.yPlayer = storeNamesY
        
            secondGameViewController.delegate = self
        
    }
    
    func userDidEnterInformation(info: String) {
        declareLabel.text = info
        declareLabel.textColor = UIColor.blue
        playerXField.text = ""
        playerYField.text = ""
        playerXField.becomeFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}

