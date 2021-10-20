//
//  Post.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//
import UIKit

class Post {
    
    //    MARK: - Properties
    
    var authorUsername: String?
    var authorImage: UIImage?
    var text: String?
    var image: UIImage?
    
    
    //    MARK: - Init
    
    init(text: String?, image: UIImage?, authorUsername: String, authorImage: UIImage?) {
        self.text = text
        self.image = image
        self.authorUsername = authorUsername
        self.authorImage = authorImage
    }
    
}
