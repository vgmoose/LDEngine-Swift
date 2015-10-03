//
//  Constants.swift
//  SwiftHello
//
//  Created by Kara on 9/30/15.
//  Copyright © 2015 Ricky Ayoub. All rights reserved.
//

/*
Temporary data class until plist/json loading is ready
*/

import Foundation
import SpriteKit

let UP_KEYCODE = 14
let LEFT_KEYCODE = 12
let RIGHT_KEYCODE = 15
let DOWN_KEYCODE = 13

#if os(iOS)
    typealias LDColor = UIColor
#else
    typealias LDColor = NSColor
#endif
