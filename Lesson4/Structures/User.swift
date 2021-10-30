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
}
