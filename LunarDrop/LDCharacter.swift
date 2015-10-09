//
//  LDCharacter.swift
//  SwiftHello
//
//  Created by Kara on 9/30/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDCharacter : LDSpriteNode
{
    var direction = "down"
    var counter = 1
    var charAtlas: SKTextureAtlas
    var spunk = 30
    var world: LDScrollableWorld!
    var checkCollisions = false
    
    required init(name charName: String)
    {
        charAtlas = SKTextureAtlas(named: charName)
        
        let texture = charAtlas.textureNamed("down_1")
        super.init(initWithTexture: texture, color: UIColor.whiteColor(), size: texture.size())
        let border = SKShapeNode()
        border.path = CGPathCreateWithRoundedRect(CGRect(origin: CGPoint(x:-16, y:-16), size: self.size), 0, 0, nil)
        border.strokeColor = UIColor.blackColor()
        self.addChild(border)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func didBeginContact(contact: SKPhysicsContact)
//    {
//        
//    }
    
    func move(moveMatrix: (CGFloat, CGFloat))  -> (CGFloat, CGFloat)
    {
        
        let xDelta = moveMatrix.0
        let yDelta = moveMatrix.1
        
        self.position.x += xDelta
        self.position.y += yDelta
        
        // collision detection
        for node in world.children
        {
            if node == self { continue }
            
            let char = node as? LDCharacter
            if char == nil { continue }
            
            if self.intersectsNode(char!)
            {
                // moving right
                if xDelta > 0 && char!.position.x - char!.size.width/2 < self.position.x + self.size.width/2
                {
                    self.position.x = char!.position.x - char!.size.width
                }
                
                // moving left
                if xDelta < 0 && char!.position.x + char!.size.width/2 > self.position.x - self.size.width/2
                {
                    self.position.x = char!.position.x + char!.size.width
                }
                
                // moving down
                if yDelta > 0 && char!.position.y - char!.size.height/2 < self.position.y + self.size.height/2
                {
                    self.position.y = char!.position.y - char!.size.height
                }
                
                // moving up
                if yDelta < 0 && char!.position.x + char!.size.height/2 > self.position.x - self.size.height/2
                {
                    self.position.y = char!.position.y + char!.size.height
                }
            }
        }
        
        if abs(xDelta) >  abs(yDelta)
        {
            direction = (xDelta > 0) ? "right" : "left"
            advanceSpunk()
        }
        else if !(abs(yDelta) == 0 && abs(xDelta) == 0)
        {
            direction = (yDelta > 0) ? "up" : "down"
            advanceSpunk()
        }
        
        return moveMatrix
        
    }
    
    func redraw()
    {
        
    }
    
    func advanceSpunk()
    {
        counter = (counter+1) % spunk
        let oneOrTwo = (counter < spunk/2) ? 1 : 2
        self.texture = charAtlas.textureNamed(direction+"_"+String(oneOrTwo))
    }
}
