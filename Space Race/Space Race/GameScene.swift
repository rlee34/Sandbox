//
//  GameScene.swift
//  Space Race
//
//  Created by Ryan Lee on 3/21/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.black
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 1024, y: 384)
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
    }
   
}
