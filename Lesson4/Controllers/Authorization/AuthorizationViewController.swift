//
//  AuthorizationViewController.swift
//  Lesson3
//
//  Created by Рустем on 15.10.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    // MARK: - UI Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Action
    @IBAction func signInAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: .none))
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        guard let user = data.users.first(where: { $0.email == email })
        else {
            self.present(alert, animated: true)
            return
        }
        
        if user.password == password {
            data.currentUser = user
            guard let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
            navigationController?.pushViewController(tabBarController, animated: true)
            
        } else {
            passwordTextField.text = ""
            self.present(alert, animated: true)
        }
        
        
    }
    
    @IBAction func goToRegistrationPageAction(_ sender: UIButton) {
        guard let registrationVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else {return}
        navigationController?.pushViewController(registrationVC, animated: true)
    }
    

}
