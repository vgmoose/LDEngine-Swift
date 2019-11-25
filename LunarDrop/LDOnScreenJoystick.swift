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
    let stick:SKShapeNode = SKShapeNode()
    
    init()
    {
        let texture = SKTexture(imageNamed: "circle")
        super.init(initWithTexture: texture, color: UIColor.white, size: CGSize(width:0, height: 0))
        self.isHidden = true
        
        self.stick.strokeColor = SKColor.red
        self.addChild(stick)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(_ location: CGPoint)
    {
        touchCoors = location
        self.isHidden = false
        self.position = location
    }
    
    func move()
    {
        if !(isTouchDown) { return }
        
        let speed = player!.mySpeed

        var xDelta = (lastKnownTouchedPosition.x - touchCoors!.x)/(100)
        var yDelta = (lastKnownTouchedPosition.y - touchCoors!.y)/(100)
                
        // deadzone
        if abs(xDelta) < 0.20 { xDelta = 0 }
        if abs(yDelta) < 0.20 { yDelta = 0 }
        
        // end of joystick
        xDelta = (xDelta >  1) ?  1 : xDelta
        xDelta = (xDelta < -1) ? -1 : xDelta
        yDelta = (yDelta >  1) ?  1 : yDelta
        yDelta = (yDelta < -1) ? -1 : yDelta
        
        // square for now, do circle later
        xDelta *= speed
        yDelta *= speed
        
        self.player!.move((xDelta, yDelta))
        self.player!.world.pan((xDelta, yDelta))
    }
    
    func move(_ pos: CGPoint)
    {
        isTouchDown = true
        lastKnownTouchedPosition = pos
        
        if #available(OSX 10.10, *)
        {
            let pathToDraw:CGMutablePath = CGMutablePath()
            pathToDraw.move(to: CGPoint(x: 0, y: 0))
            pathToDraw.move(to: CGPoint(x: pos.x - self.position.x, y: pos.y - self.position.y))
            self.stick.path = pathToDraw
        }
    }

    func release(_ pos: CGPoint)
    {
        isTouchDown = false
        self.isHidden = true
    }
}
