//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Var
    var usersData: [User] = []
    let dataManager = DataManager()
    var user: User?
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUsers()
    }
    
    //MARK: - Private func to get users
    private func prepareUsers() {
        dataManager.getUsers(completion: processingUser(_:))
    }
    
    private func processingUser(_ users: [User]) {
        users.forEach { user in
            usersData.append(user)
        }
    }
    
    //MARK: - Show alert func
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Validate e-mail and password
    func isValidEmail(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z]{1,64}@[A-Za-z0-9]{1,64}\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email) {
            return true
        } else {
            showAlert(title: "E-mail validation alert", message: "Wrong email format. Write the correct e-mail")
            return false
        }
    }
    
    func isValidPassword(_ pass: String?) -> Bool {
        let passRegEx = "(?=.*[0-9])[a-zA-Z0-9]{6,64}"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        if passPred.evaluate(with: pass) {
            return true
        } else {
            showAlert(title: "Password validation alert", message: "Wrong password format. Password should contains only latin letters, have atleast 1 digit and have more than 6 signs. ")
            return false
        }
    }
    
    //MARK: - Button's action
    @IBAction func loginButton(_ sender: Any) {
        if isValidEmail(mailTextField.text) && isValidPassword(passwordTextField.text) {
            user = usersData.first(where: { user in
                mailTextField.text == user.eMail
            })
            if passwordTextField.text == user?.password {
                sleep(3)
                performSegue(withIdentifier: "toTabBarSegue", sender: nil)
                mailTextField.text = nil
                passwordTextField.text = nil
            } else {
                showAlert(title: "User did not found", message: "Check e-mail or password")
            }
        }
    }
    
}
