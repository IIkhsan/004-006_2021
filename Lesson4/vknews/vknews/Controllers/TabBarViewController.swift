//
//  TabBarViewController.swift
//  vknews
//
//  Created by itisioslab on 10.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Properties
    private var currentUser: Account?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    func setCurrentUser(user: Account) -> Void { currentUser = user }
    func getCurrentUser() -> Account? { return currentUser }
}
