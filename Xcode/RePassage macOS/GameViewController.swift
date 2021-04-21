//
//  GameViewController.swift
//  RePassage macOS
//
//  Created by Geoff Hom on 4/9/21.
//

import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let scene = GameScene.newGameScene()

    // Present the scene
    let skView = self.view as! SKView
    skView.presentScene(scene)

    skView.ignoresSiblingOrder = true

    skView.showsFPS = true
    skView.showsNodeCount = true
  }

}

