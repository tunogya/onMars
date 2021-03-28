//
//  ContentView.swift
//  Shared
//
//  Created by 丁涯 on 2021/3/11.
//

import SwiftUI
import SpriteKit

let screen = UIScreen.main.bounds

struct ContentView: View {
    @ObservedObject var motion: MotionManager = MotionManager()
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: screen.width, height: screen.height)
        return scene
    }
    
    var debug: some View  {
        VStack {
            Text("Magnetometer Data")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .frame(width: screen.width, height: screen.height)
                .ignoresSafeArea()
            debug
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
