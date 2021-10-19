//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let error = validateFields()
        
        if (error) {
            showAlert(title: "Invalid email or password", message: "Please, try again")
        } else {
            //тут проедполагается работа с бд и добавление пользователя
        }
        
    }
    
    private func validateFields() -> Bool {
        
        let email = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Validator.isEmailValid(email) && Validator.isPasswordValid(password) {
            return true
        }
        
        return false
    }
}

extension UIViewController {
    public func showAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
