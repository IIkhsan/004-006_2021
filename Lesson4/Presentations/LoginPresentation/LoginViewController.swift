//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if mailTextField.text == "123", passwordTextField.text == "123" {
            performSegue(withIdentifier: "loginSegue", sender: nil)
            mailTextField.text = nil
            passwordTextField.text = nil
        }
    }
    
}
