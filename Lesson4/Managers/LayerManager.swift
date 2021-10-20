//
//  LayerManager.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import Foundation
import UIKit

class LayerManager {
    
    public func makeViewRounded(view: UIView) {
        view.layer.borderWidth = 1
           view.layer.masksToBounds = false
           view.layer.borderColor = UIColor.black.cgColor
           view.layer.cornerRadius = view.frame.height/2
           view.clipsToBounds = true
    }
}
