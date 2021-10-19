//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    //MARK: - IBAction
    @IBAction func loginButtonAction(_ sender: Any) {
        let validationManager = ValidationManager()
        if validationManager.authorization(login: loginTextField.text ?? "", password: passwordTextField.text ?? "", controller: self) {
            guard let tabBarController = storyboard?.instantiateViewController(identifier: "TabBarController") else { return }
            navigationController?.viewControllers = [tabBarController]
        }
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        performSegue(withIdentifier: "signUpSegue", sender: sender)
        
    }
    
    //MARK: - View Controller's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        signUpButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}
