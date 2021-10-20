//
//  LogInView.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class LogInView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordValidationErrorLabel: UILabel!
    @IBOutlet weak var loginValidationErrorLabel: UILabel!
    
    //MARK: - Public functions
    func handleLoginValidation (isValid: Bool) {
        if isValid {
            loginValidationErrorLabel.text = " "
        } else {
            loginValidationErrorLabel.text = "Invalid email"
        }
    }
    
    func handlePasswordValidation (result: (isValid: Bool, errorMsg: String?)) {
        if result.isValid {
            passwordValidationErrorLabel.text = " "
        } else {
            passwordValidationErrorLabel.text = result.errorMsg
        }
    }
    
    func getValidationErrorAlert(isLoginValid: Bool, passwordValidationResult: (isValid: Bool,errorMsg: String?)) -> UIAlertController {
        var alertTitle = ""
        var alertDesc: String?
        if !isLoginValid {
            alertTitle.append("Invalid email")
            if !passwordValidationResult.isValid {
                alertTitle.append(", ")
            }
        }
        if !passwordValidationResult.isValid {
            alertTitle.append("Wrong password")
            alertDesc = passwordValidationResult.errorMsg
        }
        let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: { _ in alert.dismiss(animated: true, completion: nil) })
        alert.addAction(action)
        return alert
    }
    
    func getAlertAboutEnteredUser(user: User?) -> UIAlertController? {
        guard let user = user else { return nil }
        let alertTitle = "You entered in as \(user.name)"
        let description =
        """
         city: \(user.city)
         status: \(user.status)
         subs: \(user.subscribersCount)
         """
        let alert = UIAlertController(title: alertTitle, message: description, preferredStyle: .alert)
        return alert
    }
    
    public func getAlertAboutExistingUsers() -> UIAlertController {
        let alert = UIAlertController(title: "Пользователи:", message:
       """
        1)ildar@gmail.com
        ildar123456
        2)leha@gmail.com
        leha123456
        3)sanya@gmail.com
        sanya123456
        """, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(action)
        return alert
    }

}
