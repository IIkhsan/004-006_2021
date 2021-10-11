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
        guard let nickname = nicknameTextField.text else { return }
        guard let firstName = firstNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let login = loginTextField.text else { return }
        guard let phoneNumber = phoneNumberTextField.text else { return }
        guard let town = townTextField.text else { return }
        guard let secondName = secondNameTextField.text else { return }
        guard let placeOfWork = placeOfWorkTextField.text else { return }
        
        let newUser = User(firstName: firstName, secondName: secondName, nickname: nickname, number: phoneNumber, placeOfWork: placeOfWork, town: town, avatar: "aa.jpg")
        db[[login, password]] = newUser
        userNow = newUser
        
        performSegue(withIdentifier: "RegisterTabBarSegue", sender: nil)
    }
}
