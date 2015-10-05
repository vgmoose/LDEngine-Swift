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
    let dummy = LDControllableCharacter(name: "Link")
    let world = LDScrollableWorld()
    
    override func didMoveToView(view: SKView)
    {
        playerSprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        dummy.position = CGPoint(x:CGRectGetMidX(self.frame)-60, y:CGRectGetMidY(self.frame));
        playerSprite.world = world
        world.addChild(playerSprite)
        self.addChild(world)
        world.addChild(dummy)
        dummy.direction = "right"
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
