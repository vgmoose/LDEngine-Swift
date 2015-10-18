//
//  LDSyncedCharacter.swift
//  LunarDrop
//
//  Created by Kara on 10/18/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation
import SpriteKit

class LDSyncedCharacter : LDCharacter
{
    var sched: NSDictionary?
    var myName: String?
    var slider: LDTimeSlider?
    
    init()
    {
        super.init(name: "Link")
    }
    
    func sync()
    {
        let timeKey = String(self.slider!.time)
        
        // move to the appropriate x and y positions for the current time and timeline
        self.position.x = CGFloat(( ((self.sched![timeKey] as! NSDictionary)["x"] as! Int) - (slider!.map.width/2))  * slider!.map.width)
        self.position.y = CGFloat(( ((self.sched![timeKey] as! NSDictionary)["y"] as! Int) - (slider!.map.height/2)) * slider!.map.height)

        
        print(self.position.x, self.position.y)
    }

    required init(name charName: String) {
        fatalError("init(name:) has not been implemented")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}