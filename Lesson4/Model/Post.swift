//
//  Post.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 14.10.2021.
//

import Foundation

class Post {
    var avatar: String?
    var textOfPost: String?
    var name: String?
    var imageOfOfPost: String?
    var datePost: String?
    
    init(photo: String?, textInPost: String?, nameOfPost: String?, image: String?, dateOfPost: String?) {
        avatar = photo
        textOfPost = textInPost
        name = nameOfPost
        imageOfOfPost = image
        datePost = dateOfPost
    }
}
