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
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
