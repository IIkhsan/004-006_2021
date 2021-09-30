//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: Any) {
        if mailTextField.text == "admin", passwordTextField.text == "admin" {
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
            mailTextField.text = ""
            passwordTextField.text = ""
        }
    }
}
