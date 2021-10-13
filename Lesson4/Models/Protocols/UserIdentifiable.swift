//
//  UserIdentifiable.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

/// a protocol that recognises a user property
protocol UserIdentifiable {
    var user: User? { get set }
}
