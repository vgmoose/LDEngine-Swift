//
//  AppDelegate.swift
//  SwiftHello
//
//  Created by Kara on 9/29/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class MacAppDelegate: NSObject, NSApplicationDelegate {
        
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        /* Pick a size for the scene */
        if let scene = GameScene(fileNamed:"GameScene") {
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            self.skView!.presentScene(scene)
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            self.skView!.ignoresSiblingOrder = true
            
            self.skView!.showsFPS = true
            self.skView!.showsNodeCount = true
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
