//
//  User.swift
//  Lesson4
//
//  Created by Семен Соколов on 14.10.2021.
//

import Foundation
import UIKit

struct User {
    var profileImage: UIImage?
    let nick: String
    var status: String
    var city: String
    var education: String
    var work: String
    var martialStatus: String
    var phoneNumber: String
    var instagram: String
    let email: String
    let password: String
    let posts: [Post]
}
