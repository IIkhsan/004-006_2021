//
//  ViewController.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Initialization
    
    var users: [User] = []
    let dataManager = DataManager()
    var user: User?
    
    // Outlets
    
    @IBOutlet weak var instagramLogoImageView: UIImageView!
    @IBOutlet weak var loginPasswordStackView: UIStackView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var entryButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prepare users func call
        
        prepareUsers()
        
        // Initialization
        
        instagramLogoImageView.image = #imageLiteral(resourceName: "instagramLogo")
        loginTextField.placeholder = "Телефон, имя пользователя или эл.адрес"
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        entryButton.layer.cornerRadius = 5
    }
    
    // MARK: - Private funcs
    
    private func alertCall(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isEmailValid(email: String?) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailPredicate.evaluate(with: email) {
            return true
        }
        else {
            alertCall(title: "Email validation", message: "The email is invalid. Write valid email address.")
            return false
        }
    }
    
    private func isPasswordValid(password: String?) -> Bool {
            let passwordRegex = "(?=.*[0-9])[a-zA-Z0-9]{6,64}"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordPredicate.evaluate(with: password) {
            return true
        }
        else {
            alertCall(title: "Password validation", message: "The password is invalid. Write valid password.")
            return false
        }
    }
    
    private func prepareUsers() {
        dataManager.getUsers { users in
            self.users = users
        }
    }
    
    // Actions
    
    @IBAction func entryAction(_ sender: Any) {
            if (isEmailValid(email: loginTextField.text) && isPasswordValid(password: passwordTextField.text)) {
                user = users.first(where: { user in
                    loginTextField.text == user.profileEmail
                })
                if passwordTextField.text == user?.profilePassword {
                    sleep(3)
                    performSegue(withIdentifier: "tabBarSegue", sender: nil)
                    loginTextField.text = nil
                    passwordTextField.text = nil
                }
                else {
                    alertCall(title: "User did not found", message: "Invalid email or password!")
            }
        }
    }
}

