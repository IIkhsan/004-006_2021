//
//  RounderImages.swift
//  Lesson4
//
//  Created by Милана Махсотова on 19.10.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func makeRoundAvatar() {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
