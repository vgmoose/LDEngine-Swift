//
//  LDScrollableWorld.swift
//  LunarDrop
//
//  Created by Kara on 10/4/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDScrollableWorld : SKNode
{
    var container: CGRect?
        
    func pan(moveMatrix: (CGFloat, CGFloat))
    {
        let xDelta = moveMatrix.0
        let yDelta = moveMatrix.1
        
        self.position.x -= xDelta
        self.position.y -= yDelta
        
        // check for collisions here
        
    }
    
    func x() -> CGFloat { return CGRectGetMidX(self.container!) }
    func y() -> CGFloat { return CGRectGetMidY(self.container!) }
    
    func snap(char: LDCharacter)
    {
        self.position.x = -char.position.x + x()
        self.position.y = -char.position.y + y()
    }
}