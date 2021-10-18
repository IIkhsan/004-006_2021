//
//  TabBarController.swift
//  Lesson4
//
//  Created by andrewoch on 16.10.2021.
//

import UIKit

class TabBarController: UITabBarController {

    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "Tveatter"
    }
    

    
}
