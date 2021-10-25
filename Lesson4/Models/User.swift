//
//  UserModel.swift
//  Lesson4
//
//  Created by i.ikhsanov on 28.09.2021.
//

import Foundation
import UIKit

class User{
    var login: String
    var password: String
    
    var avatarImage: UIImage?
    var status: String?
    var lastActivity: String
    var friendNum: Int
    var city: String
    var education: String
    var followersNumber: Int
    var images: [UIImage]?
    var posts: [Post]?
    
    init(login: String, password: String, avatarImage: UIImage?, status: String, lastActivity: String, friendNum: Int, city: String, education: String, followersNumber: Int, images: [UIImage]?, posts: [Post]?) {
        self.login = login
        self.password = password
        self.avatarImage = avatarImage
        self.status = status
        self.lastActivity = lastActivity
        self.friendNum = friendNum
        self.city = city
        self.education = education
        self.followersNumber = followersNumber
        self.images = images
        self.posts = posts
    }
}
