//
//  SignupViewController.swift
//  Lesson4
//
//  Created by Илья on 18.10.2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupLabel: UILabel!
    @IBAction func signupButton(_ sender: Any) {
        
        //Валидация почты и алерт
        let email = validEmail(email: loginTextField.text!)
        if(email == false) {
                     IncorrectEmailFormat(with: nil, description: nil)
                }
        //Валидация пароля и алерт
        if (passwordTextField.text == confirmPasswordTextField.text) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
        else {
            PasswordsAreDifferent(with: nil, description: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //func
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

    func validEmail(email : String) -> Bool
        {

            let emailPattern =  (#"^\S+@\S+\.\S+$"#)
            let emailTesting = NSPredicate(format: "SELF MATCHES %@", emailPattern)
            return emailTesting.evaluate(with: email)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
