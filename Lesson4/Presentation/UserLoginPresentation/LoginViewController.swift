//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func loginButtonAction(_ sender: Any) {
        for user in UserModel.users {
            if loginTextField.text == user.username && passwordTextField.text == user.password {
                guard let tabBarController = storyboard?.instantiateViewController(identifier: "TabBarController") else { return }
                navigationController?.viewControllers = [tabBarController]
                print(1)
            }
        }
    }
    /*
    // -TODO: navigationBar чтобы везде нормально выглядел
     TODO: LOGOUT, REGISTRATION
     TODO: 5 HOMEWORK
 */
    @IBAction func signUpButtonAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        signUpButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
}
