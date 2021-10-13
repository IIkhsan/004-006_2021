//
//  AuthService.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

struct AuthService {
    
    /// mock list of users
    private let users = [
        User(id: "user1", name: "Evans Owamoyo", email: "lordvidex.prime@gmail.com", password: "lordvidex", image: UIImage(named: "user1")),
        User(id: "user2", name: "Collin Burrows", email: "hobbs@gmail.com", password: "collhobbs", image: UIImage(named: "user2")),
        User(id: "user3", name: "James Brown", email: "jeanclaude@yahoo.com", password: "jeanclaude", image: UIImage(named: "user3")),
    ]
    
    /// logs in a user with email and password
    func login(email: String, password: String) -> User? {
        users.first { user in
            email == user.email && password == user.password
        }
    }
    
    /// silently logs in an already cached user to prevent reauthentication
    func silentLogin() -> User? {
        return users[0]
    }
}
