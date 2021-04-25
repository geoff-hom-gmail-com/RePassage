//
//  InterfaceController.swift
//  RePassage watchOS App Extension
//
//  Created by Geoff Hom on 4/9/21.
//

import Foundation
import WatchKit

class InterfaceController: WKInterfaceController {
  @IBOutlet var skInterface: WKInterfaceSKScene!

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    let scene = GameScene.newGameScene()

    // Present the scene
    skInterface.presentScene(scene)

    // Use a preferredFramesPerSecond that will maintain consistent frame rate
    skInterface.preferredFramesPerSecond = 30
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
}
