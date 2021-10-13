//
//  UserNavigationController.swift
//  Lesson4
//
//  Created by Руслан on 07.10.2021.
//

import UIKit

protocol ForUser: AnyObject {
    
    var user: User? { get set }
}

class UserNavigationController: UINavigationController {
    
    var user: User? {
        didSet {
            configureTopViewController()
        }
    }
    weak var contentsTabBarController: ContentsTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopViewController()
    }
    
    private func configureTopViewController() {
        if let topViewController = topViewController as? ForUser {
            topViewController.user = user
        }
    }
    
    func logout() {
        contentsTabBarController?.presentLoginController(animated: true)
    }

}
