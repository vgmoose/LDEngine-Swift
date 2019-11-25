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
    let fontSize:CGFloat = 25
    var charsPerLine: Int = 0
    var churnCounter: Double = 0
    var textSpeed:Double = 5 //  1 character every 5 frames (12 characters a second)
    var world:GameScene
    
    init(scene: GameScene)
    {
        world = scene
        target = "Hello there this is a long sentence and everybody can read how long this sentence is and now there's more to this sentence okay. Yep. But the sentence doesn't have to stop there. It can go on forever and ever. These words are unending and they will never stop. They shall continue and continue until they can't continue any longer. At that moment, it will all become painstakenly clear about the state and status of things and places and people and all of the above."
//        target = "Here are more words and text that should be processed and if it is not processed then we are most likely going to run into a real and sincere problem!"
        
        super.init(initWithTexture: nil, color: UIColor.red, size: CGSize(width:10, height: 10))
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.position = CGPoint(x:0, y:50)

        charsPerLine = Int(scene.size.width/(fontSize*0.62))
        applyFormatting(fields)
        
        print("Length of string:", target.characters.count)
        print("Screen width: ", scene.size.width)
        print("Number of letters that can fit at size 30: ", scene.size.width/(fontSize*0.62))

    }
    
    func reset(text:String)
    {
        target = text
        churnCounter = 0
    }
    
    func applyFormatting(_ fields: Array<SKLabelNode>)
    {
        var count:Int = 0
        
        for label:SKLabelNode in fields
        {
            label.fontSize = CGFloat(fontSize)
            label.fontColor = UIColor.white
            label.position = CGPoint(x:0, y:fontSize*CGFloat(fields.count-1) - CGFloat(count)*fontSize)
            label.fontName = "LCD Solid"
            label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            
            count += 1
            self.addChild(label)
        }
    }
    
    func churn()
    {
        var count:Int = 0
        var overlap:Int = 0
        churnCounter += 1/textSpeed
        let targetChars:Array<Character> = Array(target.characters)

        var totalOverlap:Int = 0
        
        for label:SKLabelNode in fields
        {
            let startIndex = count*charsPerLine - totalOverlap
            var endIndex = startIndex + charsPerLine
            if startIndex < targetChars.count && startIndex < Int(churnCounter)
            {
                
                if endIndex >= Int(churnCounter)
                {
                    endIndex = Int(churnCounter)
                }
                
                // end of the line, make sure we aren't in the middle of a word
                else
                {
                    overlap = 0
                    // find the start of this word and adjust the overlap offset
                    var stepper:Int = endIndex
                    while stepper > startIndex && stepper < targetChars.count && targetChars[stepper] != " " && targetChars[stepper-1] != " "
                    {
                        stepper -= 1
                        overlap += 1
                    }
                    
                    endIndex -= overlap
                    totalOverlap += overlap
                }
                
                if endIndex >= targetChars.count
                {
                    endIndex = targetChars.count
                }
                
                label.text = String(targetChars[startIndex..<endIndex])
            }
            count += 1
        }
    }
    
    func buttonDown(_ key: Int)
    {
        if key == A_KEYCODE
        {
            if world.timeIsFlowing
            {
                world.timeIsFlowing = false
            }
        }
    }
    
    func buttonUp(_ key: Int)
    {
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
