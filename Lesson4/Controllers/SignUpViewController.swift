//
//  SignUpViewController.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    
    //    MARK: - Properties

    var validator: Validator = Validator()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validator.delegate = self
    }
    
    
    // MARK: - Actions
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        guard let username = usernameTextField.text else {
            return
        }
        if username == "" {
            showValidationAlert(message: "Username cannot be empty!")
            return
        }
        if isUsernameUsed(username) {
            showValidationAlert(message: "That username is already used!")
            return
        }
        guard let email = emailTextField.text else {
            return
        }
        if !validator.validateEmail(email) {return}
        
        if isEmailUsed(email) {
            showValidationAlert(message: "That email is already used!")
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        if !validator.validatePassword(password) {
            return
        }
        
        guard let repassword = retypePasswordTextField.text else {
            return
        }
        if repassword == "" {
            showValidationAlert(message: "Please retype password to sign up!")
            return
        }
        
        if password == repassword {
            
            let user = User(username: username, email: email, password: password)
            saveUserData(user: user)
            signUp(user)
        }else{
            showValidationAlert(message: "Passwords do not match!")
            return
        }
    }
    
    
    // MARK: - Private functions
    
    private func isUsernameUsed(_ username: String) -> Bool{
        
        if let usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String]{
            return usernames.contains(username)
        }
        return false
    }
    
    private func isEmailUsed(_ email: String) -> Bool{
        
        if let emails:[String] = UserDefaults.standard.array(forKey: "emails") as? [String]{
            return emails.contains(email)
        }
        return false
    }
    
    private func saveUserData(user: User){
        
        var usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? DataManager.defaultUsersNames
        var emails:[String] = UserDefaults.standard.array(forKey: "emails") as? [String] ?? DataManager.defaultUsersEmails
        var passwords:[String] = UserDefaults.standard.array(forKey: "passwords") as? [String] ?? DataManager.defaultUsersPasswords
        
        usernames.append(user.username ?? "")
        emails.append(user.email ?? "")
        passwords.append(user.password ?? "")
        
        
        UserDefaults.standard.set(usernames, forKey: "usernames")
        UserDefaults.standard.set(emails, forKey: "emails")
        UserDefaults.standard.set(passwords, forKey: "passwords")
        
        UserDefaults.standard.set(usernames.count - 1,forKey: "currentUserId")
    }
    
    private func signUp(_ user: User){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "TabBarController") as! TabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
}


//   MARK: - Delegate

extension SignUpViewController: ValidatorDelegate{
    
    func showValidationAlert(message: String) {
        
        let dismissAction = UIAlertAction(title: "Ок", style: .default, handler: {action in action.isEnabled = false})
        let alertController = UIAlertController(title: "Валидация", message: message, preferredStyle: .alert)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
