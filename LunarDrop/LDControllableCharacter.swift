//
//  LDControllableCharacter.swift
//  SwiftHello
//
//  Created by Kara on 9/30/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDControllableCharacter : LDCharacter
{
    var mySpeed: CGFloat = 1
    var keys:[Int] = []
    
    override func keyDown(theEvent: NSEvent)
    {
        let key = Int(theEvent.keyCode)
        if (!keys.contains(key))
        {
            keys.append(key)
        }
    }
    
    override func keyUp(theEvent: NSEvent)
    {
        let key = Int(theEvent.keyCode)
        if (keys.contains(key))
        {
            keys.removeAtIndex(keys.indexOf(key)!)
        }
    }
    
    override func redraw()
    {
        var xDelta = CGFloat(0), yDelta = CGFloat(0)
        
        xDelta += (keys.contains( LEFT_KEYCODE)) ? -mySpeed : 0
        xDelta += (keys.contains(RIGHT_KEYCODE)) ?  mySpeed : 0
        yDelta += (keys.contains( DOWN_KEYCODE)) ? -mySpeed : 0
        yDelta += (keys.contains(   UP_KEYCODE)) ?  mySpeed : 0
        
        move((xDelta, yDelta))
//        print(self.keys)
        
        super.redraw()

    }

}