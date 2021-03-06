//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Ryan Lee on 1/16/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var toastLabel: UILabel!
    
    var countries = [String]()
    var correctAnswer = 0
    var lastAnswer = ""
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        repeat {
            
            countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
        
            correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
            title = countries[correctAnswer].uppercased()
            
        } while countries[correctAnswer] == lastAnswer
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            toastLabel.text = title
        } else {
            title = "Wrong"
            score -= 1
            toastLabel.text = title
        }
        
        scoreLabel.text = "Your current score is: \(score)"
        lastAnswer = countries[correctAnswer]
        askQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

