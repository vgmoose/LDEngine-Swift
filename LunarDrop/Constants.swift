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

let UP_KEYCODE = 0x7E
let LEFT_KEYCODE = 0x7B
let RIGHT_KEYCODE = 0x7C
let DOWN_KEYCODE = 0x7D

let DEBUG = true

#if os(iOS)
#else
    typealias UIColor = NSColor
#endif
