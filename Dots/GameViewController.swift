//
//  GameViewController.swift
//  Dots
//
//  Created by Harris Christiansen on 1/29/16.
//  Copyright (c) 2016 Harris Christiansen. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            // Set Background Color To White
            //scene.backgroundColor = UIColor.whiteColor()
            
            skView.presentScene(scene)
            
            // Create tap gesture recognizer
            let tapGestureRecognizer = UITapGestureRecognizer(target: scene, action: "handleTap:")
            skView.addGestureRecognizer(tapGestureRecognizer)
            
            // Create pan gesture recognizer
            let panGestureRecognizer = UIPanGestureRecognizer(target: scene, action: "handlePan:")
            skView.addGestureRecognizer(panGestureRecognizer)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
