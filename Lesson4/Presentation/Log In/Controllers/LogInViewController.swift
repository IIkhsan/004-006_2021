//
//  EnterViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Properties
    var logInModel = LogInModel()
    var user: User? = nil
    
    //MARK: IBOutlets
    @IBOutlet var logInView: LogInView!
    
    //MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        let isLoginValid = logInModel.validateLogin(login: logInView.loginTextField.text ?? "")
        logInView.handleLoginValidation(isValid: isLoginValid)
        let passwordValidationResult = logInModel.validatePassword(password: logInView.passwordTextField.text ?? "")
        logInView.handlePasswordValidation(result: passwordValidationResult)
        if isLoginValid && passwordValidationResult.isValid {
           DataService.checkExistingUsers(login: logInView.loginTextField.text ?? "" , password: logInView.passwordTextField.text ?? "", competion: { user in
               self.user = user
            })
            if let alert = logInView.getAlertAboutEnteredUser(user: user) {
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                    alert.dismiss(animated: true, completion: nil)
                    self.performSegue(withIdentifier: "enter", sender: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            self.performSegue(withIdentifier: "enter", sender: nil)
        } else {
            self.present(logInView.getValidationErrorAlert(isLoginValid: isLoginValid, passwordValidationResult: passwordValidationResult), animated: true, completion: nil)
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.present(logInView.getAlertAboutExistingUsers(), animated: true, completion: nil)
    }
}
