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
    var joystick = LDOnScreenJoystick()
    var slider: LDTimeSlider?
    
    override func didMoveToView(view: SKView)
    {
        // world setup
        world.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        world.container = self.frame
        
        // setup time slider
        self.slider = LDTimeSlider(world: world, mapFileName: "initial", canvas: self)
        self.addChild(self.slider!)
        
        // initial player
        playerSprite.world = world
        playerSprite.checkCollisions = true
        world.addChild(playerSprite)
        self.addChild(world)
        
        // on screen joystick
        joystick.player = playerSprite
        self.addChild(joystick)
        
        // background player (and later dynamic loading here)
//        world.addChild(dummy)
//        slider!.refresh()
        
//        dummy.position = CGPoint(x:-60, y:0);
//        dummy.direction = "right"
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
        slider!.tick()
        playerSprite.redraw()
    }
    
    override func didSimulatePhysics() {
        joystick.move()
    }
}
