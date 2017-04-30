//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Lee on 4/29/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsCurrentlyTyping = false
    
    @IBOutlet weak var calculatorWindow: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if userIsCurrentlyTyping {
                let textInWindow = calculatorWindow.text!
                calculatorWindow.text = textInWindow + digit
            } else {
                calculatorWindow.text = digit
            }
        }
        
        userIsCurrentlyTyping = true
    }
    
}

