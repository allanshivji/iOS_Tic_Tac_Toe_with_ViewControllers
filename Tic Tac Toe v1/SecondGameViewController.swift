//
//  SecondGameViewController.swift
//  Tic Tac Toe v1
//
//  Created by Allan Shivji on 3/15/19.
//  Copyright © 2019 Allan Shivji. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: String)
}

class SecondGameViewController: UIViewController {
    
    @IBOutlet weak var myPlayersLabel: UILabel!
    weak var delegate: DataEnteredDelegate? = nil
    
    var xPlayer = ""
    var yPlayer = ""
    var continution = 1

    
    let loosingAndWinning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var cross = UIImage(named: "x")
    var os = UIImage(named: "o")
    
    var currentPlayer = true
    var current: Int = 1
    
    var boardValues = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBAction func boardButtonPressed(_ sender: Any) {
        
        if boardValues[(sender as AnyObject).tag] == 0 && continution == 1 {

            boardValues[(sender as AnyObject).tag] = current

            if(currentPlayer) {
                (sender as AnyObject).setImage(cross, for: UIControl.State())
                currentPlayer = false
                current = 100
            } else {
                (sender as AnyObject).setImage(os, for: UIControl.State())
                currentPlayer = true
                current = 1
            }
        }
        mainLogic()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        myPlayersLabel.text = xPlayer + " vs " + yPlayer
    }
    
    //Checked few Logic on web
    func mainLogic() {
        
        for i in loosingAndWinning {
            
            if boardValues[i[0]] != 0 && boardValues[i[0]] == boardValues[i[1]] && boardValues[i[1]] == boardValues[i[2]] {
                
                continution = 2
                
                if boardValues[i[0]] == 1 {
                    
                    let x = xPlayer + " is the Winner..!!!"
                    delegate?.userDidEnterInformation(info: x)
                    _ = self.navigationController?.popViewController(animated: true)
                    
                } else {
                    let x = yPlayer + " is the Winner..!!!"
                    delegate?.userDidEnterInformation(info: x)
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        }
        continution = 2
        checkForDraw()
    }
    
    func checkForDraw() {
        
        for x in boardValues {
            
            if x == 0 {
                continution = 1
                break
            }
        }
        printDraw()
    }
    
    func printDraw() {
        
        if continution == 2{
            let x = "It's a DRAW...!!!"
            delegate?.userDidEnterInformation(info: x)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
}


