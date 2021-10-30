//
//  UIView+Attributes.swift
//  Lesson 4
//
//  Created by Evans Owamoyo on 23.07.2021.
//

import UIKit

extension UIImageView {
    /// helper function for making circle avatars with black borders
    func makeRounded() {
        makeRounded(withColor: .black)
    }
    
    /// helper function for making circle avatars with a given color
    func makeRounded(withColor color: UIColor) {
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
