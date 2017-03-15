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
    
    func createFirework(xMovement: CGFloat, x: Int, y: Int) {
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.name = "firework"
        node.addChild(firework)
        
        switch GKRandomSource.sharedRandom().nextInt(upperBound: 3) {
        case 0:
            firework.color = .cyan
            firework.colorBlendFactor = 1
        case 1:
            firework.color = .green
            firework.colorBlendFactor = 1
        case 2:
            firework.color = .red
            firework.colorBlendFactor = 1
        default:
            break
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: xMovement, y: 1000))
        
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
        node.run(move)
        
        let emitter = SKEmitterNode(fileNamed: "fuse")!
        emitter.position = CGPoint(x: 0, y: -22)
        node.addChild(emitter)
        
        fireworks.append(node)
        addChild(node)
    }
    
    


}
