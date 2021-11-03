//
//  User.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 03.10.2021.
//

import UIKit

struct User {
    let login: String
    let password: String
    let profileImage: UIImage?
    var name: String
    var status: String?
    var city: String
    let subscribers: Int
    let posts: [Post]
    let feed: [Post]
    
    init() {
        login = "nayfront28@gmail.com"
        password = "Nice1nicE"
        profileImage = UIImage(named: "synth1") ?? UIImage()
        name = "Алексей Горбунов"
        status = nil
        city = "Казань"
        subscribers = 635
        posts = posts1
        feed = feed1
    }
    
    init(login: String, password: String, profileImage: UIImage?, name: String, status: String?, city: String, subscribers: Int, posts: [Post], feed: [Post]) {
        self.login = login
        self.password = password
        self.profileImage = profileImage
        self.name = name
        self.status = status
        self.city = city
        self.subscribers = subscribers
        self.posts = posts
        self.feed = feed
    }
}
