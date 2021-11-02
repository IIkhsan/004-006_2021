//
//  ContentsTabBarController.swift
//  Lesson4
//
//  Created by Руслан on 07.10.2021.
//

import UIKit

class ContentsTabBarController: UITabBarController {

    // Properties
    var user: User? {
        didSet {
            configureChildControllers()
        }
    }
    static let identifier = String(describing: ContentsTabBarController.self)
    
    // MARK: - ViewController life cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if user != nil {
            configureChildControllers()
        } else {
            presentLoginController(animated: false)
        }
    }
    
    // MARK: - Methods
    
    func presentLoginController(animated: Bool) {
        guard let nav = storyboard?.instantiateViewController(withIdentifier: AuthenticationNavigationController.identifier) as? AuthenticationNavigationController else { return }
        nav.modalPresentationStyle = .fullScreen
        nav.contentsTabBarController = self
        present(nav, animated: animated, completion: nil)
    }
    
    private func configureChildControllers() {
        guard let viewControllers = viewControllers else { return }
        for childController in viewControllers {
            if let userNavigationController = childController as? UserNavigationController {
                userNavigationController.user = user
                userNavigationController.contentsTabBarController = self
            }
        }
    }

}
