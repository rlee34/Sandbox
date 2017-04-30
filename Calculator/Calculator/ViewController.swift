//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Lee on 4/29/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

enum Operator {
    case add
    case subtract
    case multiply
    case divide
    case inital
}

class ViewController: UIViewController {
    
    var userIsCurrentlyTyping = false
    var leftHandNumber: String?
    var rightHandNumber: String?
    var operation: Operator = .inital

    
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
    
    @IBAction func touchPi(_ sender: UIButton) {
        calculatorWindow.text = String(M_PI)
        userIsCurrentlyTyping = false
    }
    
    @IBAction func touchAddButton(_ sender: UIButton) {
        operation = Operator.add
        leftHandNumber = calculatorWindow.text
        calculatorWindow.text = "0"
        userIsCurrentlyTyping = false
    }
    
    @IBAction func touchEqualOperator(_ sender: UIButton) {
        rightHandNumber = calculatorWindow.text
        
        switch operation {
        case .add:
            if let leftHandNumber = leftHandNumber {
                addCurrentWith(leftNumber: leftHandNumber)
            }
        case .subtract:
            break
        case .multiply:
            break
        case .divide:
            break
        case .inital:
            break
        }
        
    }
    
    func addCurrentWith(leftNumber: String) {
        if let rightNumber = rightHandNumber {
            let sum = Double(leftNumber)! + Double(rightNumber)!
            calculatorWindow.text = String(sum)
            leftHandNumber = String(sum)
            rightHandNumber = nil
        }
    }
    
    
}

