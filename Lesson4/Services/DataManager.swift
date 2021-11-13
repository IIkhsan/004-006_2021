//
//  DataManager.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation

class DataManager {
    
    var users = [User]()
    
    public func getPosts(completion: @escaping (_ posts: [Post]) -> Void) {
        sleep(3)
        completion(GeneratePosts.generate())
    }
    
    public func getDefaultUsers(completion: @escaping (_ users: [User]) -> Void) {
        
        var user1 = GenerateUser.getUser()
        user1.email = "bond007@gmail.com"
        user1.password = "Qwerty007"
        user1.posts = GeneratePosts.generatePostsForCurrentUser(user: user1)
        
        var user2 = GenerateUser.getUser()
        user2.email = "admin1@mail.ru"
        user2.password = "Admin1"
        user2.posts = GeneratePosts.generatePostsForCurrentUser(user: user2)
        
        var user3 = GenerateUser.getUser()
        user3.email = "admin2@yandex.ru"
        user3.password = "Admin2"
        user3.posts = GeneratePosts.generatePostsForCurrentUser(user: user3)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        
        completion(users)
    }
}
