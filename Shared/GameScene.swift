//
//  GameScene.swift
//  onMars
//
//  Created by 丁涯 on 2021/3/11.
//

import SwiftUI
import SpriteKit
import CoreMotion

class GameScene: SKScene {
    @ObservedObject var motion: MotionManager = MotionManager()
    
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        initScene()
    }
}

extension GameScene {
    func initScene(){
        let background = SKSpriteNode(color: UIColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), size: CGSize(width: screen.width, height: screen.height))
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        addChild(background)
    }
}

// MARK: - Touchs
extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
