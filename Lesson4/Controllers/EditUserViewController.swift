//
//  EditUserViewController.swift
//  Lesson4
//
//  Created by andrewoch on 16.10.2021.
//

import UIKit

protocol EditUserDelegate {
    
    func reloadUserData(user:User?)
}

class EditUserViewController: UIViewController {
    
    //   MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    
    //   MARK: - Properties
    
    var user:User?
    var delegate: EditUserDelegate?
    var validator:Validator = Validator()
    
    
    //   MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    //   MARK: - Actions
    
    @IBAction func changeUsernameButtonPressed(_ sender: Any) {
        guard let delegate = delegate else {return}
        guard let username = usernameTextField.text else { return }
        
        if username == "" {
            showValidationAlert(message: "Username cannot be empty")
        }
        DataManager.changeCurrentUserName(username: username)
        user?.username = username
        delegate.reloadUserData(user: user)
    }
    
    @IBAction func changeEmailButtonPressed(_ sender: Any) {
        guard let delegate = delegate else {return}
        guard let email = emailTextField.text else { return }
        
        if !validator.validateEmail(email){return}
        
        DataManager.changeCurrentUserEmail(email: email)
        user?.email = email
        delegate.reloadUserData(user: user)
    }
    
    @IBAction func changePasswordButtonPressed(_ sender: Any) {
        guard let password = newPasswordTextField.text else { return }
        guard let repassword = retypePasswordTextField.text else { return }
        
        if !validator.validatePassword(password){return}
        
        if password == repassword {
            DataManager.changeCurrentUserPassword(password: password)
            newPasswordTextField.text = ""
            retypePasswordTextField.text = ""
        }else{
            showValidationAlert(message: "Passwords do not match!")
            return
        }
    }
    
    
    //   MARK: - Functions
    
    func configure() {
        usernameTextField.text = user?.username
        emailTextField.text = user?.email
        validator.delegate = self
    }
}


//   MARK: - Delegate

extension EditUserViewController:ValidatorDelegate{
    
    func showValidationAlert(message: String) {
        
        let dismissAction = UIAlertAction(title: "Ок", style: .default, handler: {action in action.isEnabled = false})
        let alertController = UIAlertController(title: "Валидация", message: message, preferredStyle: .alert)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
