//
//  GameScene.swift
//  Marble Maze
//
//  Created by Ryan Lee on 3/27/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import GameplayKit

enum CollisionTypes: UInt32 {
    case player = 1
    case wall = 2
    case star = 4
    case vortex = 8
    case finish = 16
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        loadLevel()
    }

    func loadLevel() {
        if let levelPath = Bundle.main.path(forResource: "level1", ofType: "txt") {
            if let levelString = try? String(contentsOfFile: levelPath) {
                let lines = levelString.components(separatedBy: "\n")
                
                for (row, line) in lines.reversed().enumerated() {
                    for (column, letter) in line.characters.enumerated() {
                        let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                        
                        if letter == "x" {
                            let node = SKSpriteNode(imageNamed: "block")
                            node.position = position
                            
                            node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                            node.physicsBody!.categoryBitMask = CollisionTypes.wall.rawValue
                            node.physicsBody!.isDynamic = false
                            addChild(node)
                        } else if letter == "v" {
                            let node = SKSpriteNode(imageNamed: "vortex")
                            node.name = "vortex"
                            node.position = position
                            node.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi, duration: 1)))
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody!.isDynamic = false
                            
                            node.physicsBody!.categoryBitMask = CollisionTypes.vortex.rawValue
                            node.physicsBody!.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody!.collisionBitMask = 0
                            addChild(node)
                        } else if letter == "s" {
                            let node = SKSpriteNode(imageNamed: "star")
                            node.name = "star"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody!.isDynamic = false
                            
                            node.physicsBody!.categoryBitMask = CollisionTypes.star.rawValue
                            node.physicsBody!.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody!.collisionBitMask = 0
                            node.position = position
                            addChild(node)
                        } else if letter == "f" {
                            let node = SKSpriteNode(imageNamed: "finish")
                            node.name = "finish"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody!.isDynamic = false
                            
                            node.physicsBody!.categoryBitMask = CollisionTypes.finish.rawValue
                            node.physicsBody!.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody!.collisionBitMask = 0
                            node.position = position
                            addChild(node)
                        }
                    }
                }
            }
        }
        
    }
}