//
//  User.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation
import UIKit

struct User {
    var name: String?
    var avatarImage: UIImage?
    var hometown: String?
    var numberOfFriends: String?
    var lastActivity: String?
    var status: String?
    var email: String?
    var password: String?
    var posts: [Post]?
    
    init() {

    }
    
    init(name: String, avatarImage: UIImage, hometown: String, numberOfFriends: String, lastActivity: String, status: String) {
        self.name = name
        self.avatarImage = avatarImage
        self.hometown = hometown
        self.numberOfFriends = numberOfFriends
        self.lastActivity = lastActivity
        self.status = status
    }
}
