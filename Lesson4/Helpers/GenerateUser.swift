//
//  GenerateUser.swift
//  Lesson4
//
//  Created by Милана Махсотова on 15.10.2021.
//

import Foundation
import UIKit

class GenerateUser {
    
    //MARK: - Properties
    static var currentUser: User!
    static let names = ["Milana", "Marat", "Kolya", "Elina"]
    static let avatars = ["image1", "image2", "image3", "image4"]
    static let activivties = ["📱 last seen resently", "📲 online", "📞 last seen 2 hours ago", "was at 3:28"]
    static let cities = ["Kazan", "Moscow", "Nizhnekamsk", "Almetyevsk"]
    
    //MARK: - Static functions
    static func getUser() -> User {
        return User(name: names.randomElement()!, avatarImage: UIImage(named: avatars.randomElement()!)!, hometown: cities.randomElement()!, numberOfFriends: String(Int.random(in: 1...1000)) + " friends", lastActivity: activivties.randomElement()!, status: "dead inside")
    }
    
    static func getCurrentUser() -> User {
        currentUser = getUser()
        return currentUser
    }
}
