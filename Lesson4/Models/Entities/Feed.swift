//
//  Feed.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit


struct Feed {
    let author: Author
    var time = Date()
    var content: String? = nil
    var image: UIImage? = nil
    
    var type: FeedType {
        if content != nil && image == nil {
            return .contentOnly
        } else if image != nil && content == nil {
            return .imageOnly
        } else if image != nil && content != nil {
            return .both
        } else {
            fatalError("Feed must contain either content or image or both")
        }
    }
    
}

enum FeedType {
    case imageOnly, contentOnly, both
}
