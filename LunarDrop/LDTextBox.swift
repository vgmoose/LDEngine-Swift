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
    var charsPerLine: Int = 0
    var churnCounter: Double = 0
    var textSpeed:Double = 5 //  1 character every 5 frames (12 characters a second)
    
    init(scene: LDScene)
    {
        
        target = "Hello there this is a long sentence and everybody can read how long this sentence is and now there's more to this sentence okay. Yep."
        
        super.init(initWithTexture: nil, color: UIColor.redColor(), size: CGSize(width:10, height: 10))
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.position = CGPoint(x:0, y:50)

        charsPerLine = Int(scene.size.width/(fontSize*0.62))
        applyFormatting(fields)
        
        print("Length of string:", target.characters.count)
        print("Screen width: ", scene.size.width)
        print("Number of letters that can fit at size 30: ", scene.size.width/(fontSize*0.62))

    }
    
    func applyFormatting(fields: Array<SKLabelNode>)
    {
        var count:Int = 0
        
        for label:SKLabelNode in fields
        {
            label.fontSize = CGFloat(fontSize)
            label.fontColor = UIColor.whiteColor()
            label.position = CGPoint(x:0, y:fontSize*CGFloat(fields.count-1) - CGFloat(count)*fontSize)
            label.fontName = "LCD Solid"
            label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
            
            count += 1
            self.addChild(label)
        }
    }
    
    func churn()
    {
        var count:Int = 0
        churnCounter += 1/textSpeed
        let targetChars:Array<Character> = Array(target.characters)

        for label:SKLabelNode in fields
        {
            let startIndex = count*charsPerLine
            var endIndex = (count+1)*charsPerLine
            if startIndex < targetChars.count && startIndex < Int(churnCounter)
            {
                if endIndex >= targetChars.count
                {
                    endIndex = targetChars.count
                }
                if endIndex >= Int(churnCounter)
                {
                    endIndex = Int(churnCounter)
                }
                
                label.text = String(targetChars[startIndex..<endIndex])
            }
            count += 1
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}