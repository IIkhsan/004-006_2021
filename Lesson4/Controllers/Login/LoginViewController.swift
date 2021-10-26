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
        let error = validateFields()
        if (!error) {
            showAlert(title: "Invalid email or password", message: "Please, try again")
        } else {
            //тут проедполагается работа с бд и добавление пользователя
        }
    }
    
    //MARK: - Private Fucntions
    private func validateFields() -> Bool {
        
        let email = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Validator.isEmailValid(email) && Validator.isPasswordValid(password) {
            return true
        }
        return false
    }
}
