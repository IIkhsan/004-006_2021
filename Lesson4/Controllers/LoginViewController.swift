//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 14.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
    }
    
    // MARK: - IBActions
    @IBAction func loginFieldChanged(_ sender: Any) {
        if passwordTextField.text != "" {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0.9, alpha: 1)
        }
    }
    
    @IBAction func passwordFieldChanged(_ sender: Any) {
        if loginTextField.text != "" {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0.9, alpha: 1)
        }
    }

    @IBAction func logIntoAccount(_ sender: Any) {
        let login = NSPredicate(format: "SELF MATCHES %@ ", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        
        if !login.evaluate(with: loginTextField.text) {
            getAlert(title: "Ошибка валидации", message: "Логин не соответствует требованиям!")
        }
        
        if !password.evaluate(with: passwordTextField.text) {
            getAlert(title: "Ошибка валидации", message: "Пароль не соответствует требованиям!")
        }
        
        guard User.сheckPassword(login: loginTextField.text ?? " ", password: passwordTextField.text ?? " ") else {
            getAlert(title: "Ошибка входа", message: "Неверный логин или пароль!")
            return
        }
        User.setLoggedInUserId(mail: loginTextField.text ?? " ")
    }
    
    @IBAction func getUsersPassword(_ sender: Any) {
        getAlert(title: "Пароли", message: "tattebakery@yandex.ru : pwwEQ5mL\n brianmcw@mail.ru : 7sfqCKYN\n stephjianni@gmail.com : JpS8nFEd")
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
        passwordTextField.text = ""
    }
    
    //MARK: Private methods
    private func getAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
