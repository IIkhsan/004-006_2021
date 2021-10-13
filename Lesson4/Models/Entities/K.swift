//
//  K.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

struct K {
    //MARK: - segue identifiers
    static let gotoMain = "gotoMain"
    static let gotoAuth = "gotoAuth"
    
    // MARK: - global helper functions
    public static func delay(bySeconds seconds: Double,
                     dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .background),
                     closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
}
