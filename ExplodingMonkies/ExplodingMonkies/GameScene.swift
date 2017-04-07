//
//  GameScene.swift
//  ExplodingMonkies
//
//  Created by Ryan Lee on 4/7/17.
//  Copyright © 2017 Creaky-Door. All rights reserved.
//

import SpriteKit
import GameplayKit

enum CollisionTypes: UInt32 {
    case banana = 1
    case building = 2
    case player = 4
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
    }
}
