//
//  OrientationManager.swift
//  SingleScreenRotate
//
//  Created by Nathan Furman on 28/12/2021.
//

import Foundation
import UIKit

class OrientationHandler {
    @objc static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
            
    @objc static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}

