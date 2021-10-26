//
//  Post.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation
import UIKit

struct Post {
    
    var avatarImage: UIImage
    var name: String
    var imagePost: UIImage?
    var description: String?
    var user: User?
    
    init(user: User, imagePost: UIImage, description: String) {
        self.avatarImage = user.avatarImage!
        self.name = user.name!
        self.imagePost = imagePost
        self.description = description
    }
    
    init(avatarImage: UIImage, name: String, imagePost: UIImage?, description: String?) {
        self.avatarImage = avatarImage
        self.name = name
        if let image = imagePost {
            self.imagePost = image
        }
        if let descriptionPost = description {
            self.description = descriptionPost
        }
    }
}
