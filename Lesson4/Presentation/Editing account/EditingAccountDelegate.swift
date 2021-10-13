//
//  EditingAccountDelegate.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import Foundation

protocol EditingAccountDelegate: AnyObject {
    func editProfile(_ user: User)
}