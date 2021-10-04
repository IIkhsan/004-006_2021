//
//  InitialViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class LoginlViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Button's actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.feedsSeque.rawValue, sender: nil)
    }
    
    //MARK: - Helpers
    private func configure() {
        
    }
}
