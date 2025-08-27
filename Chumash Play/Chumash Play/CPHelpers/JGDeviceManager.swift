//
//  JGDeviceManager.swift
//  Chumash Play
//
//



import UIKit

class JGDeviceManager {
    static let shared = JGDeviceManager()
    
    var deviceType: UIUserInterfaceIdiom
    
    private init() {
        self.deviceType = UIDevice.current.userInterfaceIdiom
    }
}
