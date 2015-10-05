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
    func pan(moveMatrix: (CGFloat, CGFloat))
    {
        let xDelta = moveMatrix.0
        let yDelta = moveMatrix.1
        
        self.position.x -= xDelta
        self.position.y -= yDelta
        
        // check for collisions here
        
    }
}