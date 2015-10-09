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
    let joystick = LDOnScreenJoystick()
    
    override func didMoveToView(view: SKView)
    {
        // initial player
        playerSprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        playerSprite.world = world
        world.addChild(playerSprite)
        self.addChild(world)
        
        // on screen joystick
        joystick.player = playerSprite
        self.addChild(joystick)
        
        // background player (and later dynamic loading here)
        world.addChild(dummy)
        dummy.position = CGPoint(x:CGRectGetMidX(self.frame)-60, y:CGRectGetMidY(self.frame));
        dummy.direction = "right"
    }
    
    override func touchStart(location: CGPoint)
    {
        joystick.start(location)
    }
    
    override func touchDrag(location: CGPoint)
    {
        joystick.move(location)
    }
    
    override func touchEnd(location: CGPoint)
    {
        joystick.release(location)
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
    
    override func didSimulatePhysics() {
        joystick.move()
    }
}
