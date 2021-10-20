//
//  DataService.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation
import UIKit
class DataService {
    
    //MARK: - Properties
    static var existingUser: User?
    private var dataGenerator = DataGenerator()
    
    //MARK: - Public functions
    func requireUser(completion: @escaping (User) -> Void) {
        sleep(3)
        let user = dataGenerator.generateUser()
        dataGenerator.fillArrayOfPostsForUser(user: user, count: Int.random(in: 5..<13))
        completion(user)
    }
    
    func requireArrayOfPosts(completion: @escaping ([Post]) -> Void) {
        sleep(3)
        completion(dataGenerator.generateArrayOfPosts(count: 28))
    }
    
    static func checkExistingUsers(login: String, password: String, competion: @escaping (User?) -> Void) {
        switch (login, password) {
        case ("ildar@gmail.com", "ildar123456"):
            let image = UIImage(named: "ildar")!
            let user = User(avatarImage: image, name: "Ильдар Ринатович", city: "Челябинск", phoneNumber: "+799999999", friendsCount: 100, subscribersCount: 100, status: "kaif💯")
            user.posts.append(Post(content: "умные мысли часто преследуют меня, но я быстрее", contentImage: nil, authorImage: user.avatarImage, authorName: user.name, likesCount: 15, date: Date()))
            let postImg = UIImage(named: "winter")!
            user.posts.append(Post(content: "Ду", contentImage: postImg, authorImage: user.avatarImage, authorName: user.name, likesCount: 21, date: Date()))
            existingUser = user
            competion(user)
        return
        case ("leha@gmail.com", "leha123456"):
            let image = UIImage(named: "leha")!
            let user = User(avatarImage: image, name: "Алексей Алексеевич", city: "Kazan", phoneNumber: "+73232643232", friendsCount: 120, subscribersCount: 120, status: "🙉")
            user.posts.append(Post(content: "авотлаывлтовыатол", contentImage: nil, authorImage: user.avatarImage, authorName: user.name, likesCount: 23, date: Date()))
            existingUser = user
            competion(user)
            return
        case ("sanya@gmail.com", "sanya123456"):
            let image = UIImage(named: "sanya")!
            let user = User(avatarImage: image, name: "Саня Саня", city: "Kostanay", phoneNumber: "+7391892112", friendsCount: 231, subscribersCount: 321, status: "fgdjkgfdjkfgdjk")
            user.posts.append(Post(content: "dsjfdsjklfdsjlkfsdjklsdfjlkdsfjkljklds", contentImage: nil, authorImage: user.avatarImage, authorName: user.name, likesCount: 12, date: Date()))
            existingUser = user
            competion(user)
            return
        case (_, _): return
        }
    }
}


