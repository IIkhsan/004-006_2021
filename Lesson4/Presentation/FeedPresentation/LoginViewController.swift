//
//  LoginViewController.swift
//  Lesson4
//
//
//

import UIKit

class LoginViewController: UIViewController {

    //IBOOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        if (loginTextField.text == "123" && passwordTextField.text == "123") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
        else {
            IncorrectData(with: nil, description: nil)
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    @IBOutlet weak var signupLabel: UILabel!
    
    //funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.autocorrectionType = .no
        passwordTextField.clearButtonMode = . whileEditing
        
    }
    
    private func IncorrectData(with title: String?, description: String?) {
        let alertController = UIAlertController(title: "Error", message: "Login/Password is incorrect", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) {action in alertController.dismiss(animated: true, completion: nil)}
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
