//
//  TabBarController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 17.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    private var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setCurrentUser(user: User) -> Void { currentUser = user }
    
    func getCurrentUser() -> User? { return currentUser }
}
