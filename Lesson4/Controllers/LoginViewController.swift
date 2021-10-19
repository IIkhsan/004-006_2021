//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 14.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false

    }
    
    @IBAction func loginFieldChanged(_ sender: Any) {
        if passwordTextField.text != "" {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0.9, alpha: 1)
        }
    }
    
    @IBAction func passwordFieldChanged(_ sender: Any) {
        if loginTextField.text != "" {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0.9, alpha: 1)
        }
    }
    

    @IBAction func logIntoAccount(_ sender: Any) {
       
    }
    
}
