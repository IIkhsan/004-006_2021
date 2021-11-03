//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 03.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    var users: [User] = []
    var user: User = User()
    
    //MARK: - Outlets
    @IBOutlet weak var errorOrWelcomeText: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Actions
    @IBAction func signinAction(_ sender: Any) {
        
        let login = loginTextField.text
        let password = passwordTextField.text
        
        if validateLogin(login: login) {
            if validatePassword(password: password) {
                user = users.first(where: { user in login == user.login
                }) ?? User()
                
                if password == user.password {
                    
                    if DataManager.user == nil {
                        DataManager.user = user
                    }
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let accountViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
                    accountViewController.modalPresentationStyle = .fullScreen
                    present(accountViewController, animated: true, completion: nil)
                } else {
                    showAlert(title: "Wrong Password or Email", message: "Please make sure the password or email is correct")
                }
            } else {
                showAlert(title: "Validation Alert", message: "Password must be atleast 9 characters and contain atlest 1 digit and 1 capital letter.")
            }
        } else {
            showAlert(title: "Validation Alert", message: "Login must be in email format.")
        }
    }
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUsers()
    }
    
    //MARK: - Private Functions
    private func prepareUsers() {
        DataManager.fillUsersData { [weak self] users in
            guard let self = self else { return }
            self.users = users
        }
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func validateLogin(login: String?) -> Bool {
        let loginRegex = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let loginPredicate = NSPredicate(format:"SELF MATCHES %@", loginRegex)
        
        return loginPredicate.evaluate(with: login)
    }

    private func validatePassword(password: String?) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{9,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        return passwordPredicate.evaluate(with: password)
    }
}
