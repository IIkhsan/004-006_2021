//
//  TabBarViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 18.10.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}
