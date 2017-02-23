//
//  GameScene.swift
//  Swifty Ninja
//
//  Created by Ryan Lee on 2/23/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "sliceBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        physicsWorld.speed = 0.85
     
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
