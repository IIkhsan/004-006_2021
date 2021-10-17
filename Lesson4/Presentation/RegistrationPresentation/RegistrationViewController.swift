//
//  RegistrationViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 06.10.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var townTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var placeOfWorkTextField: UITextField!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action functions
    @IBAction func registerButtonAction(_ sender: Any) {
        // Properties
        guard let placeOfWork = placeOfWorkTextField.text,
              let nickname = nicknameTextField.text,
              let firstName = firstNameTextField.text,
              let password = passwordTextField.text,
              let login = loginTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let town = townTextField.text,
              let secondName = secondNameTextField.text else { return }
        
        checkFields(nickname: nickname, firstName: firstName, secondName: secondName, phoneNumber: phoneNumber, login: login, password: password)
        
        idNow += 1
        let newUser = User(id: idNow, firstName: firstName, secondName: secondName, nickname: nickname, number: phoneNumber, placeOfWork: placeOfWork, town: town, avatar: "aa.jpg")
        db[[login, password]] = newUser
        userNow = newUser
        
        performSegue(withIdentifier: "RegisterTabBarSegue", sender: nil)
    }
    
    // MARK: - Private functions
    private func checkFields(nickname: String, firstName: String, secondName: String, phoneNumber: String, login: String, password: String) {
        for key in db.keys {
            if key[0] == login {
                loginTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
                showAlert(title: "Login alert", description: "Login is already in use!")
            } else {
                loginTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
            }
        }
        
        if !isNicknameValide(nickname: nickname) {
            nicknameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "Nickname alert", description: "Nickname length must be at least 4 and contains only english letters")
        } else {
            nicknameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isNameValide(name: firstName) {
            firstNameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "First name alert", description: "First name should contains only english letters")
        } else {
            firstNameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isNameValide(name: secondName) {
            secondNameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "First name alert", description: "Second name should contains only english letters")
        } else {
            secondNameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if phoneNumber != "" {
            if !isPhoneNumberValide(phoneNumber: phoneNumber) {
                phoneNumberTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
                showAlert(title: "Phone number alert", description: "Phone number should contains only digits and it's length must be 11 characters")
            } else {
                phoneNumberTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
            }
        } else {
            phoneNumberTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isLoginValide(login: login) {
            loginTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "Login alert", description: "Login should contains valide email")
        } else {
            loginTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isPasswordValide(password: password) {
            passwordTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "Password alert", description: "Password should contains at least one digit and it's length must be at least 6 characters")
        } else {
            passwordTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
    }
    
    private func showAlert(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
