//
//  LDScene.swift
//  LunarDrop
//
//  Created by Kara on 10/3/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDScene : SKScene
{
    #if os(iOS)
    // hardware / bluetooth HID input for ios here
    #else
    override func keyDown(event : NSEvent)
    {
        buttonDown(Int(event.keyCode))
    }
    override func keyUp(event : NSEvent)
    {
        buttonUp(Int(event.keyCode))
    }
    #endif
    
    // Button listeners
    func buttonDown(key : Int) {}
    func buttonUp(key : Int) {}
}