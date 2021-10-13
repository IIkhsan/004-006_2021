//
//  User.swift
//  Lesson4
//
//  Created by Руслан on 06.10.2021.
//

import UIKit

struct Post {
    var accountLogo: UIImage?
    var accountName: String
    var date: String
    var text: String?
    var image: UIImage?
}

struct User {
    let username: String
    let password: String
    let avatarImage: UIImage?
    let fullName: String
    let status: String?
    let lastActivity: String?
    let friendsCount: String?
    let city: String?
    let education: String?
    let followersCount: String?
    var images: [UIImage?]
    let posts: [Post]
}
