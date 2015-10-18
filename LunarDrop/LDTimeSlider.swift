//
//  TimeSlider.swift
//  SwiftHello
//
//  Created by Kara on 10/2/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDTimeSlider : LDSpriteNode
{
    var slider:SKShapeNode = SKShapeNode()
    var time:Int = 0
    let world: LDScrollableWorld
    var map: LDMap
    
    init(world: LDScrollableWorld, mapFileName: String)
    {
        // initialize texture
        let texture = SKTexture(imageNamed: "circle")
        
        // initialize world and map variables
        self.world = world
        self.map = LDMap(fileName: mapFileName)

        super.init(initWithTexture: texture, color: UIColor.whiteColor(), size: CGSize(width:0, height: 0))
                
        // add all the characters from the map to the world
        for curChar:LDSyncedCharacter in self.map.chars
        {
            self.world.addChild(curChar)
            curChar.slider = self
        }
        
        self.hidden = true
        
        // add slider node
        self.slider.strokeColor = SKColor.redColor()
        self.addChild(slider)
        
        // perform initial refresh
        refresh()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh()
    {
        for curChar:LDSyncedCharacter in self.map.chars
        {
            curChar.sync()
        }
    }
    
    func warpTime(newTime:Int)
    {
        time = newTime
        refresh()
    }
    
    
    
}