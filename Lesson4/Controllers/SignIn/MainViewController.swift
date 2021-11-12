//
//  MainViewController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 17.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    //properties
    let validator = Validator()
    let userService = UserService()

    // MARK: - IBOutlets
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    // MARK: - IBAction
    @IBAction func signInTouch(_ sender: Any) {
        guard let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        
        let nickname = nicknameTextField.text
        let password = passwordTextField.text
        
        if (!validator.isValidLogin(login: nickname)) {
            showAlert(alertTitle: "Ошибка!", alertMessage: "Неправильный формат логина", actionTitle: "Понял")
        } else if (!validator.isValidPassword(password: password)) {
            showAlert(alertTitle: "Ошибка!", alertMessage: "Неправильный формат пароля", actionTitle: "Ок, Босс")
        }
        
        if let currentUser = userService.getUser(login: nickname!, password: password!) {
            tabBarController.setCurrentUser(user: currentUser)
            navigationController?.pushViewController(tabBarController, animated: true)
        } else {
            showAlert(alertTitle: "Попался!", alertMessage: "Нет такого пользователя", actionTitle: "Хе, хе")
        }

    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "IntroSet")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
           self.view.insertSubview(backgroundImage, at: 0)
    }
    
    // MARK: - Functions
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String) -> Void {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let disissAction = UIAlertAction(title: actionTitle, style: .destructive) { action in alertController.dismiss(animated: true, completion: nil) }
        
        alertController.addAction(disissAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
