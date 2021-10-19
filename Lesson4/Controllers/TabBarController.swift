//
//  TabBarController.swift
//  Lesson3
//
//  Created by Рустем on 15.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBar.tintColor = .black
    }
    
    // MARK: - Action
    
    func exit() {
        navigationController?.popViewController(animated: true)
    }
}
