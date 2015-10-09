//
//  LDOnScreenJoystick.swift
//  LunarDrop
//
//  Created by Kara on 10/3/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDOnScreenJoystick : LDSpriteNode
{
    var player: LDControllableCharacter?
    var isTouchDown = false
    var touchCoors: CGPoint?
    var lastKnownTouchedPosition = CGPoint(x:0, y:0)
    
    init()
    {
        let texture = SKTexture(imageNamed: "circle")
        super.init(initWithTexture: texture, color: UIColor.whiteColor(), size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(location: CGPoint)
    {
        touchCoors = location
    }
    
    func move()
    {
        if !(isTouchDown) { return }
        
        let speed = player!.mySpeed

        var xDelta = (lastKnownTouchedPosition.x - touchCoors!.x)/(100*speed)
        var yDelta = (lastKnownTouchedPosition.y - touchCoors!.y)/(100*speed)
        
        print(xDelta, yDelta)
        
        // deadzone
        if abs(xDelta) < 0.20 { xDelta = 0 }
        if abs(yDelta) < 0.20 { yDelta = 0 }
        
        // square for now, do circle later
        xDelta = (xDelta >  speed) ?  speed : xDelta
        xDelta = (xDelta < -speed) ? -speed : xDelta
        yDelta = (yDelta >  speed) ?  speed : yDelta
        yDelta = (yDelta < -speed) ? -speed : yDelta
        
        self.player!.move((xDelta, yDelta))
        self.player!.world.pan((xDelta, yDelta))
    }
    
    func move(pos: CGPoint)
    {
        isTouchDown = true
        lastKnownTouchedPosition = pos
    }

    func release(pos: CGPoint)
    {
        isTouchDown = false
    }
}