//
//  Constants.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

struct AppConstants {
    // MARK: - Segue Identifiers
    static let gotoMain = "gotoMain"
    static let gotoAuth = "gotoAuth"
    static let gotoProfileEdit = "editProfile"
    // details segues
    static let gotoContentDetails = "gotoContent"
    static let gotoDetails = "gotoBoth"
    static let gotoImageDetails = "gotoImage"
    
    // MARK: - Cell Identifiers
    static let feedCell = "FeedCell"
    static let imageFeedCell = "ImageFeedCell"
    static let contentFeedCell = "ContentFeedCell"
    
    // MARK: - ViewController Identifiers
    static let authVC = "authVC"
    
    // MARK: - global functions
    public static func delay(bySeconds seconds: Double,
                     dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .background),
                     closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
}
