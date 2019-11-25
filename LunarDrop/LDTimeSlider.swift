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
    let timebar: LDBar
    var time:Int = -20
    let world: LDScrollableWorld
    var map: LDMap
    
    init(world: LDScrollableWorld, mapFileName: String, canvas: LDScene)
    {
        // initialize texture
        let texture = SKTexture(imageNamed: "circle")
        
        // initialize world and map variables
        self.world = world
        self.map = LDMap(fileName: mapFileName)
        
        // time bars
        self.timebar = LDBar(size: CGSize(width: canvas.size.width, height: 50), position: CGPoint(x: canvas.size.width/2, y:0))

        super.init(initWithTexture: texture, color: UIColor.red, size: CGSize(width: 0, height: 0))
        
        self.timebar.slider = self
                
        // add all the characters from the map to the world
        for curChar:LDSyncedCharacter in self.map.chars
        {
            self.world.addChild(curChar)
            curChar.slider = self
        }
        
//        self.hidden = false
//        
//        // add slider properties
        self.addChild( timebar)
        
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
    
    func tick()
    {
        warpTime(time + 1)
    }
    
    func warpTime(_ newTime:Int)
    {
        if (newTime - time > 1)
        {
            print("WARPING TIME FROM ", time, " to ", newTime)
        }

        time = newTime
        if (time >= 0)
        {
            timebar.set(CGFloat(time) / 1440.0)
            refresh()
        }
    }
    
    
    
}
