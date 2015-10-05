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
    
    required init(name charName: String)
    {
        charAtlas = SKTextureAtlas(named: charName)
        
        let texture = charAtlas.textureNamed("down_1")
        super.init(initWithTexture: texture, color: UIColor.whiteColor(), size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(moveMatrix: (CGFloat, CGFloat))  -> (CGFloat, CGFloat)
    {
//        let oldX = self.position.x
//        let oldY = self.position.y
        
        let xDelta = moveMatrix.0
        let yDelta = moveMatrix.1
        
        self.position.x += xDelta
        self.position.y += yDelta
        
        // check for collisions here
        
        if (abs(xDelta) > abs(yDelta))
        {
            direction = (xDelta > 0) ? "right" : "left"
            advanceSpunk()
        }
        else if !(xDelta == 0 && yDelta == 0)
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
