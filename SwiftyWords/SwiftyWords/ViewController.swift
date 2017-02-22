//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Ryan Lee on 1/31/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var currentAnswer: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: Any) {
        
        if let solutionPosition = solutions.index(of: currentAnswer.text!) {
            activatedButtons.removeAll()
            
            var splitClues = answersLabel.text!.components(separatedBy: "\n")
            splitClues[solutionPosition] = currentAnswer.text!
            answersLabel.text = splitClues.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            correctGuesses += 1
            
            if correctGuesses % 7 == 0 && correctGuesses != 0 {
                if level < 3 {
                    let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                    present(ac, animated: true)
                } else {
                    let ac = UIAlertController(title: "Game Over", message: "You've completed all 3 levels, way to go!", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: playAgain))
                    present(ac, animated: true)
                }
            }
        } else {
            clearTapped(self)
            score -= 1
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        
        currentAnswer.text = ""
        
        for btn in activatedButtons {
            btn.alpha = 1
        }
        
        activatedButtons.removeAll()
    }
    
    var letterButtons = [UIButton]()
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var correctGuesses = 0
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in view.subviews where subview.tag == 1001 {
            let btn = subview as! UIButton
            letterButtons.append(btn)
            btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
        }
        
        loadLevel()
        
    }
    
    func loadLevel() {
        
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt") {
            if let levelContents = try? String(contentsOfFile: levelFilePath) {
                var lines = levelContents.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.characters.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]

        if letterBits.count == letterButtons.count {
            for i in 0 ..< letterBits.count {
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
        
        correctGuesses = 0
        
    }
    
    func levelUp(action: UIAlertAction) {
        
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons {
            btn.alpha = 1
        }
    }
    
    func playAgain(action: UIAlertAction) {
        
        level = 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons {
            btn.alpha = 1
        }
    }
    
    func letterTapped(btn: UIButton) {
        
        if let currentAnswerText = currentAnswer.text, let buttonTitle = btn.titleLabel?.text {
            currentAnswer.text = currentAnswerText + buttonTitle
            activatedButtons.append(btn)
            
            UIView.animate(withDuration: 0.8) {
                btn.alpha = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

