//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 30.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.layer.cornerRadius = loginTextField.layer.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.layer.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.layer.frame.height / 4
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if (loginTextField.text?.isEmpty) != nil && ((passwordTextField.text?.isEmpty) != nil) {
            let user = User(login: loginTextField.text!, password: passwordTextField.text!)
            performSegue(withIdentifier: "TabBarController", sender: user)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TabBarController", let user = sender as? User {
            let destinationController = segue.destination as? TabBarController
            
            destinationController?.user = user
        }
    }
}
