//
//  GameScene.swift
//  SwiftHello
//
//  Created by Kara on 9/29/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let myLabel = SKLabelNode(fontNamed:"Sana Regular")
    let playerSprite = LDCharacter(name: "Link")
    
    override func didMoveToView(view: SKView)
    {
        /* Setup your scene here */
        self.myLabel.text = String(self.children.count)
        self.myLabel.fontSize = 45;
        self.myLabel.color = NSColor.whiteColor()
        self.myLabel.zPosition = 99
        self.myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(self.myLabel)
        
        playerSprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));

        self.addChild(playerSprite)
    }
    
    override func mouseDown(theEvent: NSEvent)
    {
        /* Called when a mouse click occurs */
        
        let location = theEvent.locationInNode(self)
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.position = location;
        sprite.setScale(0.5)
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        sprite.runAction(SKAction.repeatActionForever(action), withKey:"spin")
        
        self.myLabel.text = String(self.children.count)
        
        self.addChild(sprite)
    }
    
    override func keyDown(theEvent: NSEvent)
    {
//        let key = theEvent.keyCode
//        let speed = CGFloat(15)
//        
//        switch (key)
//        {
//        case 12:
//            self.children[1].position.x -= speed
//            self.children[1].zRotation = CGFloat(M_PI_2)
//            break
//        case 13:
//            self.children[1].position.y -= speed
//            self.children[1].zRotation = CGFloat(M_PI)
//            break
//        case 14:
//            self.children[1].position.y += speed
//            self.children[1].zRotation = CGFloat(0)
//            break
//        case 15:
//            self.children[1].position.x += speed
//            self.children[1].zRotation = CGFloat(M_PI_2+M_PI)
//            break
//        default:
//            break
//        }
        playerSprite.keyDown(theEvent)
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
}
