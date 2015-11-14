//
//  LDBar.swift
//  LunarDrop
//
//  Created by Kara on 11/11/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDBar : SKSpriteNode
{
    let overlay: SKSpriteNode
    
    init(size: CGSize, position: CGPoint)
    {
        self.overlay = SKSpriteNode(color: UIColor.redColor(), size: size)
                
        super.init(texture: nil, color: UIColor.greenColor(), size: size)
        self.position = position
        self.overlay.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.overlay.position.x = -self.size.width/2
        
        set(0)
        
        self.addChild(overlay)
        
        
    }
    
    func set(percent: CGFloat)
    {
        self.overlay.size.width = self.size.width*percent
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}