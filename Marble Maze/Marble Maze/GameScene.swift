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
    case start = 4
    case vortex = 8
    case finish = 16
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
    }

    func loadLevel() {
        if let levelPath = Bundle.main.path(forResource: "level1", ofType: "txt") {
            if let levelString = try? String(contentsOfFile: levelPath) {
                let lines = levelString.components(separatedBy: "\n")
                
                for (row, line) in lines.reversed().enumerated() {
                    for (column, letter) in line.characters.enumerated() {
                        let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                        
                        if letter == "x" {
                            // load wall
                        } else if letter == "v" {
                            // load vortex
                        } else if letter == "s" {
                            // load star
                        } else if letter == "f" {
                            // load finish
                        }
                    }
                }
            }
        }
        
    }
}
