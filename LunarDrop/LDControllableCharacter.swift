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
    
    func buttonDown(_ key: Int)
    {
        if (!keys.contains(key))
        {
            keys.append(key)
        }
    }
    
    func buttonUp(_ key: Int)
    {
        if (keys.contains(key))
        {
            if let val = keys.index(of: key) {
                keys.remove(at: val)
            }
        }
    }
    
    override func touchStart(_ location: CGPoint)
    {
        print("You clicked on this character at ",location)
    }
    
    override func redraw()
    {
        var xDelta = CGFloat(0), yDelta = CGFloat(0)
        
        xDelta += (keys.contains( LEFT_KEYCODE)) ? -mySpeed : 0
        xDelta += (keys.contains(RIGHT_KEYCODE)) ?  mySpeed : 0
        yDelta += (keys.contains( DOWN_KEYCODE)) ? -mySpeed : 0
        yDelta += (keys.contains(   UP_KEYCODE)) ?  mySpeed : 0
                
        let actualMovement = move((xDelta, yDelta))
        if (world != nil)
        {
            world.pan(actualMovement)
        }
//        print(self.keys)
        
        super.redraw()

    }

}
