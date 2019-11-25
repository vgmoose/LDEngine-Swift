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
    override func keyDown(with event : NSEvent)
    {
        buttonDown(Int(event.keyCode))
    }
    
    override func keyUp(with event : NSEvent)
    {
        buttonUp(Int(event.keyCode))
    }
    
    override func mouseDown(with event : NSEvent)
    {
        touchStart(event.location(in: self))
    }
    
    override func mouseDragged(with event : NSEvent)
    {
        touchDrag(event.location(in: self))
    }
    
    override func mouseUp(with event : NSEvent)
    {
        touchEnd(event.location(in: self))
    }
    #endif    
    
    // Button listeners
    func buttonDown(_ key : Int) {}
    func buttonUp(_ key : Int) {}
    
    // touch listeners
    func touchStart(_ location : CGPoint) {}
    func touchDrag(_ location : CGPoint) {}
    func touchEnd(_ location : CGPoint) {}
}
