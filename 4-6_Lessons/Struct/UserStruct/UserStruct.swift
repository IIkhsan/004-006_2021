//
//  UserStruct.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 18.10.2021.
//

import Foundation
import UIKit

// MARK: - User struct properties

struct User {
    var profileImageView: UIImage
    var profileStatus: String
    var profileNickName: String
    var profilePassword: String
    var profileEmail: String
    var userPosts: [NewsFieldPost]
    var profileSubscribersCount: String
    var profileSubscriptionsCount: String
    var profilePublicationsCount: String
    var profilePosts: [ProfilePost]
}
