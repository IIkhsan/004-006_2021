//
//  ViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 18.10.2021.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // ViewController life cycle
    override func viewDidLoad() {
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn") == true {
            let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as! TabBarViewController
            self.navigationController?.pushViewController(tabBarVC, animated: false)
        }
        super.viewDidLoad()
    }
    
// MARK: Validation functions
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
//MARK: LogIn action and Alert Config
    
    @IBAction func logInButton(_ sender: Any) {
        if isValidPassword(passwordField.text ?? "") == true && isValidEmail(emailField.text ?? "") == true {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as! TabBarViewController
            self.navigationController?.pushViewController(tabBarVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка валидации", message: "Неверно введен логин или пароль. Убедитесь, что вы верно указали почту или пароль.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
