//
//  LDBar.swift
//  LunarDrop
//
//  Created by Kara on 11/11/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDBar : LDSpriteNode
{
    var overlay: SKSpriteNode
    var slider: LDTimeSlider?
    
    init(size: CGSize, position: CGPoint)
    {
        self.overlay = SKSpriteNode(texture: nil, color: UIColor.red, size: size)
        
        super.init(initWithTexture: nil, color: UIColor.green, size: size)
        self.position = position
        self.overlay.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.overlay.position.x = -self.size.width/2
        self.zPosition = 999
        
        set(0)
        
        self.addChild(overlay)
        
    }
    
    override func touchStart(_ location: CGPoint)
    {
        print("TRYING TO WARP TIME")
        self.slider!.warpTime( Int(((location.x + self.size.width/2) / self.size.width)*1440) )
    }
    
    func set(_ percent: CGFloat)
    {
        self.overlay.size.width = self.size.width*percent
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
