//
//  MainTabBarController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 16.10.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // set default tab bar color
        UITabBar.appearance().unselectedItemTintColor = .white.withAlphaComponent(0.6)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = tabBar.items?.firstIndex(of: item)
        if let index = index {
            if index == 0 {
                title = "Your News feeds"
                navigationController?.navigationBar.isHidden = false
            } else {
                title = ""
                navigationController?.navigationBar.isHidden = true
            }
        }
            
    }

}
