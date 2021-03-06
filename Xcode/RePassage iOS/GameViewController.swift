//
//  GameViewController.swift
//  RePassage iOS
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

  override var shouldAutorotate: Bool {
    return true
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .allButUpsideDown
    } else {
      return .all
    }
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
}
