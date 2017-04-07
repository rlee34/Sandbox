//
//  BuildingNode.swift
//  ExplodingMonkies
//
//  Created by Ryan Lee on 4/7/17.
//  Copyright © 2017 Creaky-Door. All rights reserved.
//

import SpriteKit
import UIKit

class BuildingNode: SKSpriteNode {
    var currentImage: UIImage!
    
    func setup() {
        name = "building"
        
        currentImage = drawBuilding(size: size)
        texture = SKTexture(image: currentImage)
        
        configurePhysics()
    }
    
    func configurePhysics() {
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody!.isDynamic = false
        physicsBody!.categoryBitMask = CollisionTypes.building.rawValue
        physicsBody!.contactTestBitMask = CollisionTypes.banana.rawValue
    }
}
