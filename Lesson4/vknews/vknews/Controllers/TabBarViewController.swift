//
//  TabBarViewController.swift
//  vknews
//
//  Created by itisioslab on 10.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var currentUser: Account?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setCurrentUser(user: Account) -> Void { currentUser = user }
    func getCurrentUser() -> Account? { return currentUser }
}
