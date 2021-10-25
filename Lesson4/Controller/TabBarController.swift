//
//  TabBarController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 01.10.2021.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Propeties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureControllers()
    }
    
    // MARK: - Configure ViewControllers in TabBarController
    func configureControllers() {
        let feedVCNav = viewControllers?[0] as! UINavigationController
        let feedVC = feedVCNav.viewControllers[0] as! FeedViewController
        feedVC.user = user
        
        let profileVCNav = viewControllers?[1] as! UINavigationController
        let profileVC = profileVCNav.viewControllers[0] as! ProfileViewController
        profileVC.user = user
    }
}
