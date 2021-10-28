//
//  MainTabBarViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    // MARK: - Properties
    var user: User?
}

// MARK: - UserExistenceDelegate
extension MainTabBarViewController: UserExistenceDelegate {}
