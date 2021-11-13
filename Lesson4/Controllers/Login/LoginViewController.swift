//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    let dataManager = DataManager()
    var users: [User] = []
    var user: User?
    fileprivate let segueIdentifier = "segue"
    
    // MARK: - IBOUtlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDefaultUsers()
    }
    
    // MARK: - Action login button
    @IBAction func loginButtonPressed(_ sender: Any) {
        let email = loginTextField?.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield?.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let validEmail = Validator.isEmailValid(email)
        let validPassword = Validator.isPasswordValid(password)
        
        if (!validEmail && !validPassword) {
            showAlert(title: "Invalid email and password", message: "Please, try again")
        }
        if (!validEmail) {
            showAlert(title: "Invalid email", message: "Please, try again")
        } else {
            if (!validPassword) {
                showAlert(title: "Invalid password", message: "Please, enter a password of at least 6 characters, uppercase and lowercase characters, numbers")
            } else {
                if let curUser = getUserByEmail(email: email) {
                    user = curUser
                } else {
                    showAlert(title: "Wrong email", message: nil)
                }
                if user?.password != password {
                    showAlert(title: "Wrong password", message: nil)
                } else {
                    self.performSegue(withIdentifier: segueIdentifier, sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tapBar = segue.destination as! CustomTabBarController
        let nav = tapBar.viewControllers?[1] as! UINavigationController
        let destinationViewController = nav.viewControllers.first as? ProfileViewController
        destinationViewController!.user = user!
    }

    
    // MARK: - Private Functions
    private func getDefaultUsers() {
        dataManager.getDefaultUsers {defaultUsers in
            self.users = defaultUsers
        }
    }
    private func getUserByEmail(email: String?) -> User? {
        if let user = users.first(where: {
            $0.email == email
        }) {
            return user
        } else {
            return nil
        }
    }
    
}
