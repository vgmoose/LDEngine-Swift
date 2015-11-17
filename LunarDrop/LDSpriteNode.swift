//
//  LDHudElement.swift
//  LunarDrop
//
//  Created by Kara on 10/3/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDSpriteNode : SKSpriteNode
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
    #else
    override func mouseDown(event : NSEvent)
    {
        touchStart(event.locationInNode(self))
    }
    override func mouseMoved(event : NSEvent)
    {
        touchDrag(event.locationInNode(self))
    }
    override func mouseUp(event : NSEvent)
    {
        touchEnd(event.locationInNode(self))
    }
    #endif
    
    init(initWithTexture texture : SKTexture?, color: UIColor, size: CGSize)
    {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // touch listeners
    func touchStart(location : CGPoint) {}
    func touchDrag(location : CGPoint) {}
    func touchEnd(location : CGPoint) {}

}