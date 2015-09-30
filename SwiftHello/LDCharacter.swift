//
//  LDCharacter.swift
//  SwiftHello
//
//  Created by Kara on 9/30/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDCharacter : SKSpriteNode
{
    var direction = "down"
    var counter = 1
    var playerAtlas: SKTextureAtlas
    
    required init(name charName: String)
    {
        playerAtlas = SKTextureAtlas(named: charName)
        let texture = playerAtlas.textureNamed("down_1")
        super.init(texture: texture, color: NSColor.whiteColor(), size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func keyDown(theEvent: NSEvent)
    {
        if (theEvent.keyCode == 12)
        {
            direction = "up"
            self.position.y += 5
        }
        else
        {
            direction = "down"
            self.position.y -= 5
        }
        
        redraw()
    }
    
    func redraw()
    {
        counter = (counter+1) % 10
        let oneOrTwo = (counter < 5) ? 1 : 2
        self.texture = playerAtlas.textureNamed(direction+"_"+String(oneOrTwo))
    }
}
