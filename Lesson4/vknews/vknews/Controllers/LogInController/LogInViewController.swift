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
    
//    //    MARK: - Properties
//    let validator = Validator()
//    let userService = UserService()
//
//    //    MARK: - IBAction
//        @IBAction func logIn(_ sender: Any) {
//            guard let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
//            
//            let email = emailTextField.text
//            let password = passwordTextField.text
//            
//            if (!validator.isValidLogin(login: email)) {
//                showAlert(alertTitle: "", alertMessage: "Invalid password's format", actionTitle: "Retry")
//            } else if (!validator.isValidPassword(password: password)) {
//                showAlert(alertTitle: "", alertMessage: "Invalid password's format", actionTitle: "Retry")
//            }
//            
//            if let currentUser = userService.getUser(email: email!, password: password!) {
//                LentaViewController.setCurrentUser(user: currentUser)
//                navigationController?.pushViewController(LentaViewController(), animated: true)
//            } else {
//                showAlert(alertTitle: "", alertMessage: "Пароль и/или почта неверны", actionTitle: "Назад")
//            }
//
//        }
//    
//        // MARK: - Functions
//        func showAlert(alertTitle: String, alertMessage: String, actionTitle: String) -> Void {
//            let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
//            let disissAction = UIAlertAction(title: actionTitle, style: .destructive) { action in alertController.dismiss(animated: true, completion: nil) }
//            
//            alertController.addAction(disissAction)
//            present(alertController, animated: true, completion: nil)
//        }
//        
//    }
}
