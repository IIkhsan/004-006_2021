//
//  UserStruct.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 13.10.2021.
//

import Foundation

struct User {
    let username: String
    let login: String
    let avatarImage: String
    let password: String
    var status: String
    let selfPosts: [Post]
    let personalPosts: [Post]
}
