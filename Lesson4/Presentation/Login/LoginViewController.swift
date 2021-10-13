//
//  InitialViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class LoginlViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Var
    let validator = Validator()
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Button's actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        if !validator.isValidEmail(email) {
            showErrorMessage("Неверный формат почты")
            return
        }
        if !validator.isValidPassword(password) {
            showErrorMessage("Неверный формат пароля")
            return
        }
        let user = validator.isRightData(email, password)
        if user == nil {
            showErrorMessage("Неправильная почта или пароль")
            return
        }
        performSegue(withIdentifier: Constants.feedsSeque.rawValue, sender: user)
    }
    
    //MARK: - Helpers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.feedsSeque.rawValue,
               let viewController = segue.destination as? MainTabBarViewController,
                let user = sender as? User {
                    viewController.user = user
        }
    }
    
    private func showErrorMessage(_ message: String) {
        let errorAlertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ок", style: .cancel, handler: { action in
            self.dismiss(animated: true, completion: nil)
        })
        errorAlertController.addAction(cancelAction)
        present(errorAlertController, animated: true, completion: nil)
    }
}
