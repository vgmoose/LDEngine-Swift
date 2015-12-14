//
//  LDTextBox.swift
//  LunarDrop
//
//  Created by Kara on 12/4/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDTextBox : LDSpriteNode
{
    let fields:Array<SKLabelNode> = [SKLabelNode(), SKLabelNode(), SKLabelNode()]
    var target: String
    let fontSize:CGFloat = 30
    
    init(scene: LDScene)
    {
        
        target = "Hello there this is a long sentence and everybody can read how long this sentence is and now there's more to this sentence okay. Yep."
        
        super.init(initWithTexture: nil, color: UIColor.redColor(), size: CGSize(width:10, height: 10))
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.position = CGPoint(x:0, y:50)

        applyFormatting(fields, width:Int(scene.size.width/(fontSize*0.62)))
        
        print("Length of string:", target.characters.count)
        print("Screen width: ", scene.size.width)
        print("Number of letters that can fit at size 30: ", scene.size.width/(fontSize*0.62))

    }
    
    func applyFormatting(fields: Array<SKLabelNode>, width:Int)
    {
        var count:Int = 0
        let charsPerLine:Int = width
        let targetChars:Array<Character> = Array(target.characters)
        
        for label:SKLabelNode in fields
        {
            label.fontSize = CGFloat(fontSize)
            label.fontColor = UIColor.whiteColor()
            label.position = CGPoint(x:0, y:fontSize*CGFloat(fields.count-1) - CGFloat(count)*fontSize)
            label.fontName = "LCD Solid"
            label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
            
            let startIndex = count*charsPerLine
            var endIndex = (count+1)*charsPerLine
            if startIndex < targetChars.count
            {
                if endIndex >= targetChars.count
                {
                    endIndex = targetChars.count
                }
                
                label.text = String(targetChars[startIndex..<endIndex])
            }
            
            count += 1
            self.addChild(label)
        }
    }
    
    func churn()
    {
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}