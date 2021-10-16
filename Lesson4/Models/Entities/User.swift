//
//  User.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class User {
    let id: String
    var name: String
    var email: String
    var password: String
    var image: UIImage?
    
    init(id: String, name: String, email: String, password: String, image: UIImage?) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.image = image
    }
}
