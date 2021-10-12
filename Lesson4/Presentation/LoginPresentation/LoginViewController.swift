//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: Any) {
        guard let loginView = view as? LoginView else { return }
        if loginView.mailTextField.text == "admin", loginView.passwordTextField.text == "admin" {

            performSegue(withIdentifier: "loginSegue", sender: nil)
            loginView.mailTextField.text = ""
            loginView.passwordTextField.text = ""
        }
    }
}
