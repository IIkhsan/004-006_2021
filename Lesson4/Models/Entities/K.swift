//
//  K.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

struct K {
    // MARK: - segue identifiers
    static let gotoMain = "gotoMain"
    static let gotoAuth = "gotoAuth"
    static let gotoProfileEdit = "editProfile"
    // details segues
    static let gotoContentDetails = "gotoContent"
    static let gotoDetails = "gotoBoth"
    static let gotoImageDetails = "gotoImage"
    
    // MARK: - cell identifiers
    static let feedCell = "FeedCell"
    static let feedCell_Image = "FeedCell-Image"
    static let feedCell_Content = "FeedCell-Content"
    
    // MARK: - view controller identifiers
    static let authVC = "authVC"
    
    // MARK: - global helper functions
    public static func delay(bySeconds seconds: Double,
                     dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .background),
                     closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
}
