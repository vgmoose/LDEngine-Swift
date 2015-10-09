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
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        touchStart(touches.first!.locationInNode(self))
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        touchDrag(touches.first!.locationInNode(self))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        touchEnd(touches.first!.locationInNode(self))
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?)
    {
        touchEnd(CGPoint(x:0, y:0))
    }
    #else
    override func keyDown(event : NSEvent)
    {
        buttonDown(Int(event.keyCode))
    }
    
    override func keyUp(event : NSEvent)
    {
        buttonUp(Int(event.keyCode))
    }
    
    override func mouseDown(event : NSEvent)
    {
        touchStart(event.locationInNode(self))
    }
    
    override func mouseDragged(event : NSEvent)
    {
        touchDrag(event.locationInNode(self))
    }
    
    override func mouseUp(event : NSEvent)
    {
        touchEnd(event.locationInNode(self))
    }
    #endif    
    
    // Button listeners
    func buttonDown(key : Int) {}
    func buttonUp(key : Int) {}
    
    // touch listeners
    func touchStart(location : CGPoint) {}
    func touchDrag(location : CGPoint) {}
    func touchEnd(location : CGPoint) {}
}