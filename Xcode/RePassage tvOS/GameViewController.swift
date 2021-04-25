//
//  GameViewController.swift
//  RePassage tvOS
//
//  Created by Geoff Hom on 4/9/21.
//

import GameplayKit
import SpriteKit
import UIKit

class GameViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let scene = GameScene.newGameScene()

    // Present the scene
    let skView = view as! SKView
    skView.presentScene(scene)

    skView.ignoresSiblingOrder = true

    skView.showsFPS = true
    skView.showsNodeCount = true
  }
}
