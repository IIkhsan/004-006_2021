//
//  TabBarController.swift
//  Lesson4
//
//  Created by andrewoch on 16.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    //   MARK: - Properties
    
    var user:User?
    
    
    //   MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "Tveatter"
    }
}
