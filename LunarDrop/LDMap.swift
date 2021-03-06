//
//  LDMap.swift
//  LunarDrop
//
//  Created by Kara on 10/18/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

import Foundation

class LDMap
{
    let fileName: String
    var width : Int = 0
    var height: Int = 0
    var chars = [LDSyncedCharacter]()
    
    init(fileName:String)
    {
        self.fileName = fileName
        let path = Bundle.main.path(forResource: fileName, ofType: "ld")
        
        do
        {
            let jsonData = try Data(String(contentsOfFile: path!).utf8)

            let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
            width  = jsonDict[ "width"] as! Int
            height = jsonDict["height"] as! Int
            
            print(width, height)
            
            let allChars = jsonDict["chars"] as! [Dictionary<AnyHashable, AnyHashable>]
            
            Swift.print(allChars)
            
            // go through all chars in the json and load them into our array
            for curChar in allChars
            {
                // load the various control points and tween type and times into the array
                let newChar: LDSyncedCharacter = LDSyncedCharacter()
                newChar.myName = (curChar["name"] as! String)
                newChar.sched = (curChar["sched"] as! NSDictionary)

                // index the sched keys for later
                newChar.indexKeys()
                
                // append it to the array
                self.chars.append(newChar)
            }
        }
        catch { }

    }
}
