//
//  WhackSlot.swift
//  WhackAPenguin
//
//  Created by Ryan Lee on 2/18/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
