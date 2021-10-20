//
//  User.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import Foundation
import UIKit
class User {
    
    init(avatarImage: UIImage, name: String, city: String, phoneNumber: String, friendsCount: Int, subscribersCount: Int, status: String) {
        self.avatarImage = avatarImage
        self.name = name
        self.city = city
        self.phoneNumber = phoneNumber
        self.friendsCount = friendsCount
        self.subscribersCount = subscribersCount
        self.status = status
    }
    
    var avatarImage: UIImage
    var name: String
    var city: String
    var phoneNumber: String
    var friendsCount: Int
    var subscribersCount: Int
    var status: String
    var posts: [Post] = []
}
