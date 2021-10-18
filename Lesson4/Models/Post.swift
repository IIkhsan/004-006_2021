//
//  Post.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 18.10.2021.
//

import Foundation
import UIKit

class Post {
    let authImage: UIImage
    let authName: String
    let postTime: String
    
    let postImage: UIImage!
    let postText: String!
    
    init(authImage: UIImage, authName: String, postTime: String, postImage: UIImage!, postText: String!) {
        self.authImage = authImage
        self.authName = authName
        self.postTime = postTime
        
        self.postImage = postImage
        self.postText = postText
    }
    
}
