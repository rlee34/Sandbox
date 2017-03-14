//
//  GameScene.swift
//  Fireworks
//
//  Created by Ryan Lee on 3/14/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var gameTimer: Timer!
    var fireworks = [SKNode]()
    var leftEdge = -22
    var bottomEdge = -22
    var rightEdge = 1024 + 22
    
    var score: Int = 0 {
        didSet {
            scoreLabel = "Score: \(score)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    


}
