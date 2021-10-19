//
//  DataManager.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 13.10.2021.
//

import Foundation

class DataManager {
    //MARK: - Get data from UserDatasource methods
    /// Get users from UserDatasource
    /// - Parameter completion: action after getting data
    func getPersonalPosts(completion: @escaping ([Post]) -> Void) {
        sleep(3)
        guard let currentUser = UserDatasource.currentUser else { return }
        completion(currentUser.personalPosts)
    }
    
    /// Get current user posts from UserDatasource
    /// - Parameter completion: action after getting data
    func getCurrentUserPosts(completion: @escaping ([Post]) -> Void) {
        sleep(3)
        UserDatasource.users.forEach { user in
            guard let currentUser = UserDatasource.currentUser else { return }
            if user.username == currentUser.username {
                completion(user.selfPosts)
            }
        }
    }
}
