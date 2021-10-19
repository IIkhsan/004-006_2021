//
//  Post.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import Foundation
import UIKit

class Post {
    var image: UIImage?
    var text: String?
    
    init(image: UIImage? = nil, text: String? = nil) {
        self.image = image
        self.text = text
    }
}
