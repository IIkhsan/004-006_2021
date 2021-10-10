//
//  LogInViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 04.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButton(_sender: UIButton) {
        
        let newVC = storyboard?.instantiateViewController(identifier: "TabBarController")

        if usernameTextField.text == "username" && passwordTextField.text == "password"    {
            navigationController?.pushViewController(newVC!, animated: true)
            
            usernameTextField.text = ""
            passwordTextField.text = ""
            
        }
    }
}
