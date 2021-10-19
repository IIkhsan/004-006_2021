//
//  TabBarController.swift
//  Lesson3
//
//  Created by Рустем on 15.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    func exit() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBar.tintColor = .black
    }
}
