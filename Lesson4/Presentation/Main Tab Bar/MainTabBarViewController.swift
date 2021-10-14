//
//  MainTabBarViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UserExistenceDelegate {
    //MARK: - Properties
    var user: User?
    
    //MARK: - VC cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
