//
//  SignupViewController.swift
//  Lesson4
//
//  Created by Илья on 18.10.2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupLabel: UILabel!
    @IBAction func signupButton(_ sender: Any) {
        
    //MARK - Валидация почты и алерт
    let email = validEmail(email: loginTextField.text!)
    if(email == false) {
        IncorrectEmailFormat(with: nil, description: nil)
    }
        
    //MARK - Валидация пароля и алерт
    let pass = validPassword(password: passwordTextField.text!)
    if (pass == false) {
        IncorrectPasswordFormat(with: nil, description: nil)
    }
    if (passwordTextField.text == confirmPasswordTextField.text && pass == true) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    else {
        PasswordsAreDifferent(with: nil, description: nil)
        }
    }
    
    //funcs
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func PasswordsAreDifferent(with title: String?, description: String?) {
        let alertController = UIAlertController(title: "Error", message: "Passwords are not the same", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) {action in alertController.dismiss(animated: true, completion: nil)}
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func IncorrectEmailFormat(with title: String?, description: String?) {
        let alertController = UIAlertController(title: "Error", message: "Incorrect format of Email", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) {action in alertController.dismiss(animated: true, completion: nil)}
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func IncorrectPasswordFormat(with title: String?, description: String?) {
        let alertController = UIAlertController(title: "Incorrect format of password", message: "Your password should consist of at least one number and has length of 6 symbols minimum", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) {action in alertController.dismiss(animated: true, completion: nil)}
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }

    func validEmail(email : String) -> Bool {
        let emailPattern =  (#"^\S+@\S+\.\S+$"#)
        let emailTesting = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return emailTesting.evaluate(with: email)
    }
    
    func validPassword(password: String) -> Bool {
        let passwordPattern = ("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordTesting.evaluate(with: password)
    }


}
