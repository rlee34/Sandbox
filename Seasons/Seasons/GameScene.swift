/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import SpriteKit

class GameScene: SKScene {
    
    var footer: SKNode!
    var btnNext: SKSpriteNode!
    var btnPrevious: SKSpriteNode!
    var btnSound: SKSpriteNode!
    var btnHome: SKSpriteNode!
    

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    touchMoved(to: touch.location(in: self))
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    touchUp(at: touch.location(in: self))
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    touchUp(at: touch.location(in: self))
  }
  
  // MARK:- Stub methods - override these in sub classes
  func touchDown(at point: CGPoint) {}
  func touchMoved(to point: CGPoint) {}
  func touchUp(at point: CGPoint) {}
  func getNextScene() -> SKScene? {
    return nil
  }
  func getPreviousScene() -> SKScene? {
    return nil
  }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        footer = childNode(withName: "footer")
        
        btnNext = childNode(withName: "//buttonNext") as! SKSpriteNode!
        btnPrevious = childNode(withName: "//buttonPrevious") as! SKSpriteNode!
        btnSound = childNode(withName: "//buttonSound") as! SKSpriteNode!
        btnHome = childNode(withName: "//buttonHome") as! SKSpriteNode!
    }
}
