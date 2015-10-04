//
//  GameScene.swift
//  SwiftHello
//
//  Created by Kara on 9/29/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

import SpriteKit

class GameScene: LDScene {

    let myLabel = SKLabelNode(fontNamed:"Sana Regular")
    let playerSprite = LDControllableCharacter(name: "Link")
    
    override func didMoveToView(view: SKView)
    {
        playerSprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(playerSprite)
    }
    
    override func buttonDown(key: Int)
    {
        playerSprite.buttonDown(key)
    }
    
    override func buttonUp(key: Int)
    {
        playerSprite.buttonUp(key)
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
        playerSprite.redraw()
    }
}
