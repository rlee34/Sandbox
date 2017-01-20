//
//  TitlePage.swift
//  Seasons
//
//  Created by Ryan Lee on 1/20/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import SpriteKit

class TitlePage: GameScene {

    override func getNextScene() -> SKScene? {
        return SKScene(fileNamed: "Scene01") as! Scene01
    }
}
