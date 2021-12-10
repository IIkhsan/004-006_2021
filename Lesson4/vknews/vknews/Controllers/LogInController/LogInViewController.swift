//
//  LogInViewController.swift
//  vknews
//
//  Created by itisioslab on 04.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    //    MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //    MARK: - Properties
    let validator: Validator = Validator()
    let userService = UserService()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        validator.delegate = self
    }

    //    MARK: - IBAction
    @IBAction func logInAction(_ sender: Any) {
        guard let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else { return }
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }

        if !validator.validateEmail(email) { return }
        
        if !validator.validatePassword(password) { return }
        
        else if let currentUser = userService.getUser(email: email, password: password) {
            tabBarViewController.setCurrentUser(user: currentUser)
            navigationController?.pushViewController(tabBarViewController, animated: true)
        } else {
            showValidationAlert(message: "Неправильный логин и/или пароль")
        }
    }

    
    // MARK: - Functions
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String) -> Void {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: actionTitle, style: .destructive) { action in alertController.dismiss(animated: true, completion: nil) }
            
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
    
//   MARK: - Delegate

extension LoginViewController: ValidatorDelegate{
    
    func showValidationAlert(message: String) {
        
        let dismissAction = UIAlertAction(title: "Назад", style: .default, handler: {action in action.isEnabled = false})
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
