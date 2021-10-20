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
    var users: [User] = []
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUsers()
    }
    
    // MARK: - Private methods
    
    private func prepareUsers() {
        DataManager.createDefaultUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
        }
    }
    
    // MARK: - Public methods
    
    func addUser(_ user: User) {
        users.append(user)
    }
    
    func loginUser(_ user: User) {
        guard let nav = navigationController as? AuthenticationNavigationController else { return }
        nav.user = user
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let user = users.filter({ $0.email == email }).first
        
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
