//
//  GameScene.swift
//  RePassage Shared
//
//  Created by Geoff Hom on 4/9/21.
//

import SpriteKit

class GameScene: SKScene {
  fileprivate var label: SKLabelNode?
  fileprivate var spinnyNode: SKShapeNode?

  class func newGameScene() -> GameScene {
    // Load 'GameScene.sks' as an SKScene.
    guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
      print("Failed to load GameScene.sks")
      abort()
    }

    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill

    return scene
  }

  func setUpScene() {
    // Get label node from scene and store it for use later
    label = childNode(withName: "//helloLabel") as? SKLabelNode
    if let label = self.label {
      label.alpha = 0.0
      label.run(SKAction.fadeIn(withDuration: 2.0))
    }

    // Create shape node to use during mouse interaction
    let w = (size.width + size.height) * 0.05
    spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w),
                             cornerRadius: w * 0.3)

    if let spinnyNode = self.spinnyNode {
      spinnyNode.lineWidth = 4.0
      spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi),
                                                            duration: 1)))
      spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                        SKAction.fadeOut(withDuration: 0.5),
                                        SKAction.removeFromParent()]))

      #if os(watchOS)
        // For watch we just periodically create one of these and let it spin
        // For other platforms we let user touch/mouse events create these
        spinnyNode.position = CGPoint(x: 0.0, y: 0.0)
        spinnyNode.strokeColor = SKColor.red
        run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 2.0),
                                                      SKAction.run {
                                                        let n = spinnyNode.copy() as! SKShapeNode
                                                        self.addChild(n)
                                                      }])))
      #endif
    }
  }

  #if os(watchOS)
    override func sceneDidLoad() {
      setUpScene()
    }
  #else
    override func didMove(to _: SKView) {
      setUpScene()
    }
  #endif

  func makeSpinny(at pos: CGPoint, color: SKColor) {
    if let spinny = spinnyNode?.copy() as! SKShapeNode? {
      spinny.position = pos
      spinny.strokeColor = color
      addChild(spinny)
    }
  }

  override func update(_: TimeInterval) {
    // Called before each frame is rendered
  }
}

#if os(iOS) || os(tvOS)
  // Touch-based event handling
  extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
      if let label = self.label {
        label.run(SKAction(named: "Pulse")!, withKey: "fadeInOut")
      }

      for t in touches {
        makeSpinny(at: t.location(in: self), color: SKColor.green)
      }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with _: UIEvent?) {
      for t in touches {
        makeSpinny(at: t.location(in: self), color: SKColor.blue)
      }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with _: UIEvent?) {
      for t in touches {
        makeSpinny(at: t.location(in: self), color: SKColor.red)
      }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with _: UIEvent?) {
      for t in touches {
        makeSpinny(at: t.location(in: self), color: SKColor.red)
      }
    }
  }
#endif

#if os(OSX)
  // Mouse-based event handling
  extension GameScene {
    override func mouseDown(with event: NSEvent) {
      if let label = self.label {
        label.run(SKAction(named: "Pulse")!, withKey: "fadeInOut")
      }
      makeSpinny(at: event.location(in: self), color: SKColor.green)
    }

    override func mouseDragged(with event: NSEvent) {
      makeSpinny(at: event.location(in: self), color: SKColor.blue)
    }

    override func mouseUp(with event: NSEvent) {
      makeSpinny(at: event.location(in: self), color: SKColor.red)
    }
  }
#endif
