//
//  ContentView.swift
//  Shared
//
//  Created by 丁涯 on 2021/3/11.
//

import SwiftUI
import SpriteKit
import CoreMotion

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
            VStack{
                Text("Magnetometer Data")
                Text("X: \(motion.magnetData.x)")
                Text("Y: \(motion.magnetData.y)")
                Text("Z: \(motion.magnetData.z)")
            }
            VStack {
                Text("Gyro  Data")
                Text("X: \(motion.gyroData.x)")
                Text("Y: \(motion.gyroData.y)")
                Text("Z: \(motion.gyroData.z)")
            }
           
            VStack {
                Text("ACC  Data")
                Text("X: \(motion.accData.x)")
                Text("Y: \(motion.accData.y)")
                Text("Z: \(motion.accData.z)")
            }
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
