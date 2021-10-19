//
//  RegistrationViewController.swift
//  Lesson3
//
//  Created by Рустем on 15.10.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func createAccountAction(_ sender: UIButton) {
        let alertAlreadyExists = UIAlertController(title: "Ошибка", message: "Пользователь с указанным email уже существует", preferredStyle: .alert)
        alertAlreadyExists.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: .none))
        
        let alertWrongParameters = UIAlertController(title: "Ошибка", message: "Проверьте введённые данные", preferredStyle: .alert)
        alertWrongParameters.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: .none))
        
        guard let email = emailTextField.text,
              let name = nameTextField.text,
              let password = passwordTextField.text,
              let repassword = repasswordTextField.text
        else { return }
        
        let user = data.users.first(where: { $0.email == email })
        if user != nil {
            self.present(alertAlreadyExists, animated: true)
            return
        }
        
        if validation(email: email, password: password, repassword: repassword) {
            data.users.append(User.init(name: name, email: email, password: password, profileImage: UIImage(named: "defaultava") ?? UIImage()))
            navigationController?.popToRootViewController(animated: true)
        } else {
            self.present(alertWrongParameters, animated: true)
        }
    }
    
    func validation(email: String, password: String, repassword: String) -> Bool{
        let range = NSRange(location: 0, length: email.utf16.count)
        guard let regexForEmail = try? NSRegularExpression(pattern: "[A-Za-z0-9]@[A-Za-z0-9].[a-z]") else { return false }
        guard let regexForPassword = try? NSRegularExpression(pattern: "[A-Za-z0-9]") else { return false }

        if (password.count > 6) && (password == repassword) && (regexForEmail.firstMatch(in: email, options: [], range: range) != nil) && (regexForPassword.firstMatch(in: password, options: [], range: range) != nil) {
            return true
        }
        
        return false
    }
    

}
