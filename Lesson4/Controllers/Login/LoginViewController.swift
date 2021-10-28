//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBOUtlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action login button
    @IBAction func loginButtonPressed(_ sender: Any) {
        let validEmail = validateEmail()
        let validPassword = validatePassword()
        
        if (!validEmail && !validPassword) {
            showAlert(title: "Invalid email and password", message: "Please, try again")
        }
        if (!validEmail) {
            showAlert(title: "Invalid email", message: "Please, try again")
        } else {
            if (!validPassword) {
                showAlert(title: "Invalid password", message: "Please, enter a password of at least 6 characters, uppercase and lowercase characters, numbers")
            } else {
                //добавление пользователя в бд
            }
        }
    }
    
    //MARK: - Private Functions
    private func validateEmail() -> Bool {
        let email = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return Validator.isEmailValid(email)
    }
    
    private func validatePassword() -> Bool {
        let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return Validator.isPasswordValid(password)
    }
}
