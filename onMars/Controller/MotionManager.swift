//
//  MotionManager.swift
//  onMars (iOS)
//
//  Created by 丁涯 on 2021/3/28.
//

import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    @Published var magnetData: CMMagneticField = CMMagneticField(x: 0, y: 0, z: 0)
    @Published var accData: CMAcceleration = CMAcceleration(x: 0, y: 0, z: 0)
    @Published var gyroData: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)

    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 1
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let magnetData = magnetometerData {
                self.magnetData = magnetData.magneticField
            }
        }
        
        self.motionManager.accelerometerUpdateInterval = 1
        self.motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let accData = accelerometerData {
                self.accData = accData.acceleration
            }
        }
        
        self.motionManager.gyroUpdateInterval = 1
        self.motionManager.startGyroUpdates(to: .main) { (gyroData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let gData = gyroData {
                self.gyroData = gData.rotationRate
            }
        }
    }
}
