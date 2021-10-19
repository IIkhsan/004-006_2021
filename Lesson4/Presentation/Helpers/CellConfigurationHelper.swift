//
//  CellConfigurationHelper.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 18.10.2021.
//

import UIKit
class CellConfigurationHelper {
    func makePostImage(postImage: String) -> UIImage?{
        if postImage == "" {
            return nil
        } else {
            return UIImage(named: postImage)
        }
    }
}
