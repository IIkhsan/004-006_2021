//
//  SignInViewController.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

import UIKit

class SignInViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //    MARK: - Properties
    
    var validator: Validator = Validator()
    
    
    //   MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validator.delegate = self
        
        guard let user = DataManager.getCurrentUser() else { return }
        signIn(user)
    }
    
    
    //   MARK: - Actions
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        if !validator.validateEmail(email) {return}
        
        guard let password = passwordTextField.text else {
            return
        }
        if !validator.validatePassword(password) {return}
        
        guard let user = authorizeUser(email, password) else{return}
        
        signIn(user)
        
    }
    
    
    //   MARK: - Private functions
    
    private func authorizeUser(_ email: String, _ password: String) -> User?{
        
        let usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? DataManager.defaultUsersNames
        let emails:[String] = UserDefaults.standard.array(forKey: "emails") as? [String] ?? DataManager.defaultUsersEmails
        let passwords:[String] = UserDefaults.standard.array(forKey: "passwords") as? [String] ?? DataManager.defaultUsersPasswords
        
        guard let userId = emails.firstIndex(of: email) else {
            showValidationAlert(message: "The username is wrong")
            return nil }
        
        if passwords[userId] == password {
            UserDefaults.standard.set(userId,forKey: "currentUserId")
            let user = User(username: usernames[userId], email: email, password: password)
            return user
        }else{
            showValidationAlert(message: "The password is wrong")
            return nil
        }
    }
    
    private func signIn(_ user: User){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "TabBarController") as! TabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


//   MARK: - Delegate

extension SignInViewController: ValidatorDelegate{
    
    func showValidationAlert(message: String) {
        
        let dismissAction = UIAlertAction(title: "Ок", style: .default, handler: {action in action.isEnabled = false})
        let alertController = UIAlertController(title: "Валидация", message: message, preferredStyle: .alert)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}

