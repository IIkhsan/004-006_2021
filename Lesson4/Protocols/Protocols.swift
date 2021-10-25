//
//  Protocols.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 25.10.2021.
//

import Foundation
import UIKit

// MARK: - Protocol for easier access to cells
protocol CustomCell {
    
    static func cellIdentifier() -> String
    
    static func cellNib() -> UINib?
}

// MARK: - Delegate to change profile status
protocol ChangeProfileStatusDelegate: AnyObject {
    
    func changeUserData(currentUser: User?)
}
 
