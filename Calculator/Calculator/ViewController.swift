//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Lee on 4/29/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWindow: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            print(digit)
        }
        
    }
    
}

