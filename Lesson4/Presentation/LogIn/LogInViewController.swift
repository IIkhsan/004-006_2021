//
//  LogInViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 04.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    //MARK: - Dependencies
    var usersData: [User] = []
    let dataManager = DataManager()
    var user: User?
    
    // MARK: -  View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUsers()
    }
    
    //Private functions
    private func prepareUsers() {
        dataManager.getUsers(completion: processingUser(_:))
    }
    
    private func processingUser(_ users: [User]) {
        users.forEach { user in
            usersData.append(user)
        }
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z]{1,64}@[A-Za-z0-9]{1,64}\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email) {
            return true
        } else {
            showAlert(title: "E-mail validation alert", message: "Wrong email format. Please enter correct email")
            return false
        }
    }
    
    func isValidPassword(_ pass: String?) -> Bool {
        let passRegEx = "(?=.*[0-9])[a-zA-Z0-9]{6,64}"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        if passPred.evaluate(with: pass) {
            return true
        } else {
            showAlert(title: "Password validation alert", message: "Incorrect password format. The password must contain at least 5 latin letters and at least 1 number. Please enter the correct password.")
            return false
        }
    }
    
    //MARK: - IBAction
    @IBAction func logInButton(_sender: UIButton) {
        if isValidEmail(emailTextField.text) && isValidPassword(passwordTextField.text) {
            user = usersData.first(where: { user in emailTextField.text == user.eMail
                
            })
            
            if passwordTextField.text == user?.password {
                sleep(3)
                performSegue(withIdentifier: "toTabBarSegue", sender: nil)
                emailTextField.text = nil
                passwordTextField.text = nil
            } else {
                showAlert(title: "User is not found", message: "Please check email or password")
            }
        }
    }
}
