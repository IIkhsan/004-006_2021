//
//  Post.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import Foundation
import UIKit

class Post {
    
    //MARK: - Class Properties
    var image: UIImage?
    var text: String?
    
    // MARK: - Initializer
    init(image: UIImage? = nil, text: String? = nil) {
        self.image = image
        self.text = text
    }
    
}
