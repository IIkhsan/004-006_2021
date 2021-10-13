//
//  User.swift
//  Lesson4
//
//  Created by Руслан on 13.10.2021.
//

import UIKit

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
