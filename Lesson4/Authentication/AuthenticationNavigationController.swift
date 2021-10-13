//
//  AuthenticationViewController.swift
//  Lesson4
//
//  Created by Руслан on 07.10.2021.
//

import UIKit

class AuthenticationNavigationController: UINavigationController {
    
    var user: User? {
        didSet {
            contentsTabBarController?.user = user
        }
    }
    static let identifier = String(describing: AuthenticationNavigationController.self)
    
    weak var contentsTabBarController: ContentsTabBarController?
    
}
