//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Руслан on 06.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Properties
    let dataManager = DataManager()
    let validator = Validator()
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUsers()
    }
    
    // MARK: - Private methods
    
    private func prepareUsers() {
        dataManager.createDefaultUsers { [weak self] users in
            users.forEach { [weak self] user in
                guard let self = self else { return }
                self.dataManager.addUser(user)
            }
        }
    }
    
    // MARK: - Public methods
    
    func loginUser(_ user: User) {
        guard let nav = navigationController as? AuthenticationNavigationController else { return }
        nav.user = user
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let user = dataManager.getUser(email: email)
        
        guard let email = email, validator.isValidEmail(email) else {
            showOkAlert(title: "Invalid email", description: "Please try again")
            return
        }
        
        guard let user = user else {
            showOkAlert(title: "Wrong login", description: "User with such email is not found")
            return
        }
        
        if user.password == password {
            loginUser(user)
        } else {
            showOkAlert(title: "Wrong password", description: "Please try again")
        }
    }

}
