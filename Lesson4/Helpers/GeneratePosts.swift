//
//  GeneratePosts.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation
import UIKit

class GeneratePosts {
    
    static var posts: [Post] = []
    
    static let names = ["Marat", "Milana", "Elina", "Kolya"]
    static let images = ["image1", "image2", "image3", "image4"]
    static let descriptions = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", "Всем привет", "Lorem ipsum dolor sit er elit lamet"]
    
    
    public static func generate() -> [Post] {
        for _ in 0..<5 {
            posts.append(Post(avatarImage: UIImage(named: images.randomElement()!)!, name: names.randomElement()!, imagePost: UIImage(named: images.randomElement()!), description: descriptions.randomElement()))
        }        
        return posts
    }
}
