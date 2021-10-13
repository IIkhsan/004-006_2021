//
//  UserExistenceDelegate.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import Foundation

protocol UserExistenceDelegate: AnyObject {
    var user: User? { get set }
}
