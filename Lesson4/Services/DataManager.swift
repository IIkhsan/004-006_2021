//
//  DataManager.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation

class DataManager {
    
    
    public func getPosts(completion: @escaping (_ posts: [Post]) -> Void) {
        sleep(3)
        completion(GeneratePosts.generate())
    }
    
    public func getUser(completion: @escaping (_ user: User) -> Void) {
        completion(GenerateUser.getUser())
    }
    
    public func getCurrentUser(completion: @escaping(_ user: User) -> Void) {
        completion(GenerateUser.getCurrentUser())
    }
    
    public func getPostsForCurrentUser(completion: @escaping (_ posts: [Post]) -> Void) {
        completion(GeneratePosts.generatePostsForCurrentUser())
    }
}
