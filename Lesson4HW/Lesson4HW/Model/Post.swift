//
//  Post.swift
//  Lesson4HW
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
    
    init(foto: String?, textInPost: String?, nameOfPost: String?, image: String?, dateOfPost: String?) {
        avatar = foto
        textOfPost = textInPost
        name = nameOfPost
        imageOfOfPost = image
        datePost = dateOfPost
    }
}
