//
//  User.swift
//  Lesson4
//
//  Created by Руслан on 13.10.2021.
//

import UIKit

struct User {
    let email: String
    let password: String
    let avatarImage: UIImage?
    let fullName: String
    let status: String?
    let lastActivity: String?
    let friendsCount: Int?
    let city: String?
    let education: String?
    let followersCount: Int?
    var images: [UIImage?]
    let posts: [Post]

    var friendsCountInfo: String {
        "\(friendsCount ?? 0) friends"
    }

    var followersCountInfo: String {
        "\(followersCount ?? 0) followers"
    }
}
