//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    /// Dependency
    let service = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private functions
    private func configure() {
        service.generateData()
        for a in service.data {
            profiles.append(a())
        }
    }
    
    private func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: {_ in
            alertController.dismiss(animated: true)
        }))
        present (alertController, animated: true)
    }
    
    private func validationLogin(login: String?) -> Bool {
        let loginRegex = try! NSRegularExpression(pattern: "[a-zA-Z0-9]{1,64}@[a-z0-9]{1,64}\\.[a-z0-9]{2,64}")
        if loginRegex.firstMatch(in: login ?? "", range: NSRange(location: 0, length: login?.utf16.count ?? 0)) != nil {
            return true
        } else {
            showAlert(title: "Неверный формат почты", message: "Почта должна быть на латинице и содержать формат вида: a@b.ru\nПовторите попытку!")
            return false
        }
    }
    
    private func validationPassword(password: String?) -> Bool {
        let passwordRegex = try! NSRegularExpression(pattern: "(?=.*[0-9])[a-zA-Z0-9]{6,64}")
        if passwordRegex.firstMatch(in: password ?? "", range: NSRange(location: 0, length: password?.utf16.count ?? 0)) != nil {
            return true
        } else {
            showAlert(title: "Неверный формат пароля", message: "Пароль должен быть на латинице, содержать не меньше шести символов и хотя бы одну цифру.\nПовторите попытку!")
            return false
        }
    }
    
    // MARK: - Login button
    @IBAction func loginButton(_ sender: Any) {
        guard let loginView = view as? LoginView else { return }
        if validationLogin(login: loginView.mailTextField.text) && validationPassword(password: loginView.passwordTextField.text) {
            var isTrue = true
            for profile in profiles {
                if loginView.mailTextField.text == profile.login, loginView.passwordTextField.text == profile.password {
                    profileNow = profile
                    isTrue = false
                    performSegue(withIdentifier: "loginSegue", sender:nil)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                        loginView.mailTextField.text = ""
                        loginView.passwordTextField.text = ""
                    })
                }
            }
            if isTrue {
                showAlert(title: "Ошибка входа", message: "Данный пользователь не найден. Проверьте введенные данные и повторите попытку!")
            }
        }
    }
}
