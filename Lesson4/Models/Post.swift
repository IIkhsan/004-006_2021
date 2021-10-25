//
//  Post.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 04.10.2021.
//

import Foundation
import UIKit

struct Post {
    var authorName: String
    var authorAvatar: UIImage
    var text: String?
    var image: UIImage?
    var date: String
    
    init(authorName: String, authorAvatar: UIImage, text: String?, image: UIImage?, date: String) {
        self.authorName = authorName
        self.authorAvatar = authorAvatar
        self.text = text
        self.image = image
        self.date = date
    }
}
