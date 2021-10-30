////
////  RegistrationViewController.swift
////  Lesson4
////
////  Created by Алексей Горбунов on 03.10.2021.
////
//
//import UIKit
//
//class RegistrationViewController: UIViewController {
//
//    @IBOutlet weak var errorOrWelcomeText: UILabel!
//    @IBOutlet weak var loginTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var confirmPasswordTextField: UITextField!
//
//    @IBAction func createAccountAction(_ sender: Any) {
//        guard let username = loginTextField.text,
//              let password = passwordTextField.text,
//              let confirmPassword = confirmPasswordTextField.text
//        else { return }
//
//        if password != confirmPassword {
//            errorOrWelcomeText.text = "Логин не удовлетворителен либо пароли не совпадают"
//            errorOrWelcomeText.font = UIFont(name: "System", size: 16)
//            errorOrWelcomeText.textColor = .red
//
//            loginTextField.layer.borderColor = UIColor.red.cgColor
//            passwordTextField.layer.borderColor = UIColor.red.cgColor
//            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
//        } else {
//            errorOrWelcomeText.text = "Добро пожаловать!"
//            errorOrWelcomeText.textColor = .blue
//
//            loginTextField.layer.borderColor = UIColor.blue.cgColor
//            passwordTextField.layer.borderColor = UIColor.blue.cgColor
//            confirmPasswordTextField.layer.borderColor = UIColor.blue.cgColor
//
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let accountViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//            accountViewController.modalPresentationStyle = .fullScreen
//            present(accountViewController, animated: true, completion: nil)
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//
//}
