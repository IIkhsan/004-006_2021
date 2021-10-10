//
//  LogInViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 04.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!

    // MARK: -  View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Private funcion
    
    @IBAction func logInButton(_sender: UIButton) {
        
        let newVC = storyboard?.instantiateViewController(identifier: "TabBarController")

        if usernameTextField.text == "username" && passwordTextField.text == "password" {
            navigationController?.pushViewController(newVC!, animated: true)
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}
