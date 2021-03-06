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
    var textbox: LDTextBox?
    var timeIsFlowing = true
    
    override func didMove(to view: SKView)
    {
        // world setup
        world.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        world.container = self.frame
        
        // setup time slider
        self.slider = LDTimeSlider(world: world, mapFileName: "test", canvas: self)
        self.addChild(self.slider!)
        
        // setup text box
        self.textbox = LDTextBox(scene: self)
        self.addChild(self.textbox!)
        
        // initial player
        playerSprite.world = world
        playerSprite.checkCollisions = true
        world.addChild(playerSprite)
        self.addChild(world)
        
        // on screen joystick
        joystick.player = playerSprite
        self.addChild(joystick)
        
        // create background
        let bgtexture: SKTexture = SKTexture(imageNamed: "Grass.jpg")
        let bg: SKSpriteNode = SKSpriteNode(texture: bgtexture, size: bgtexture.size())
        bg.zPosition = -100
        world.addChild(bg)
        
        self.addChild(myLabel)
        
        // background player (and later dynamic loading here)
//        world.addChild(dummy)
//        slider!.refresh()
        
//        dummy.position = CGPoint(x:-60, y:0);
//        dummy.direction = "right"
    }
    
    override func touchStart(_ location: CGPoint)
    {
        joystick.start(location)
    }
    
    override func touchDrag(_ location: CGPoint)
    {
        joystick.move(location)
    }
    
    override func touchEnd(_ location: CGPoint)
    {
        joystick.release(location)
    }
    
    override func buttonDown(_ key: Int)
    {
        playerSprite.buttonDown(key)
        textbox!.buttonDown(key)
    }
    
    override func buttonUp(_ key: Int)
    {
        playerSprite.buttonUp(key)
        textbox!.buttonUp(key)
    }
    
    override func update(_ currentTime: CFTimeInterval)
    {
        if (self.timeIsFlowing)
        {
            /* Called before each frame is rendered */
            slider!.tick()

        } else
        {
            self.textbox!.churn()
        }
        
        playerSprite.redraw()

    }
    
    override func didSimulatePhysics() {
        joystick.move()
    }
}
