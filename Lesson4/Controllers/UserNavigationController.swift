//
//  UserNavigationController.swift
//  Lesson4
//
//  Created by Руслан on 07.10.2021.
//

import UIKit

protocol UserHandlingProtocol: AnyObject {

    var user: User? { get set }
    
    func setUser(_ user: User)

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
        if let topViewController = topViewController as? UserHandlingProtocol {
            if let user = user {
                topViewController.setUser(user)
            }
        }
    }
    
    func logout() {
        contentsTabBarController?.presentLoginController(animated: true)
    }

}
