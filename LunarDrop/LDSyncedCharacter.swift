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
    var sched_keys: NSArray?
    var myName: String?
    var slider: LDTimeSlider?
    var currentKey: Int = -1
    
    init()
    {
        super.init(name: "Link")
    }
    
    func getPos(time: Int) -> (CGPoint)
    {
        if self.sched_keys!.count > currentKey + 1
        {
            let oldTime = self.sched_keys![currentKey  ] as! Int
            let newTime = self.sched_keys![currentKey+1] as! Int
            
            let oldTimeKey = String(oldTime)
            let newTimeKey = String(newTime)
            
            let ox = (((self.sched![oldTimeKey] as! NSDictionary)["x"] as! Int) - (slider!.map.width/2))  * slider!.map.width
            let oy = (((self.sched![oldTimeKey] as! NSDictionary)["y"] as! Int) - (slider!.map.height/2)) * slider!.map.height
            let nx = (((self.sched![newTimeKey] as! NSDictionary)["x"] as! Int) - (slider!.map.width/2))  * slider!.map.width
            let ny = (((self.sched![newTimeKey] as! NSDictionary)["y"] as! Int) - (slider!.map.height/2)) * slider!.map.height
            
            // percent so far for this keyframe and time
            let percent: CGFloat = CGFloat(time - oldTime) / CGFloat(newTime - oldTime);
            
            // find distance between current position and next position for current time
            let cur_x: CGFloat = CGFloat(ox) + CGFloat(nx - ox) * percent
            let cur_y: CGFloat = CGFloat(oy) + CGFloat(ny - oy) * percent
            
//            print(currentKey, "\t", ox, "\t", Int(cur_x), "\t", oy, "\t", nx, "\t", Int(cur_y), "\t", ny)

            return CGPoint(x: cur_x, y:cur_y)
        }
        else
        {
            // no future keyframes
            // get difference for last position
            
            let lastTimeKey: String = String(self.sched_keys!.lastObject as! Int)
            
            let nx = (((self.sched![lastTimeKey] as! NSDictionary)["x"] as! Int) - (slider!.map.width/2))  * slider!.map.width
            let ny = (((self.sched![lastTimeKey] as! NSDictionary)["y"] as! Int) - (slider!.map.height/2)) * slider!.map.height
            
            return CGPoint(x: nx, y:ny)
        }
    }
    
    func sync()
    {
        updateCurrentKeyIfNeeded(self.slider!.time)
//        let timeKey = String(self.slider!.time)
        
        // move to the appropriate x and y positions for the current time and timeline
        if currentKey >= 0
        {
            let newPos: CGPoint = getPos(self.slider!.time)
            
            self.move((newPos.x - self.position.x, newPos.y - self.position.y))
        }
        
//        print(self.position.x, self.position.y)
    }
    
    func updateCurrentKeyIfNeeded(time: Int)
    {
        // update for future
        if (self.sched_keys!.count > currentKey+1) && (self.sched_keys![currentKey + 1] as! Int) <= time
        {
            // update the current key
            currentKey += 1
        }
        
//        // update for past
        if (0 <= currentKey) && (self.sched_keys![currentKey ] as! Int) > time
        {
            // update the current key
            currentKey -= 1
        }
    }
    
    func indexKeys()
    {
        let intkeys:NSMutableArray = []
        let keys:NSArray = self.sched!.allKeys
        for key:Any in keys
        {
            let keyString = (key as! NSString)
            intkeys.addObject(keyString.integerValue)
        }
        self.sched_keys = intkeys
    }

    required init(name charName: String) {
        fatalError("init(name:) has not been implemented")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}