//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Marat Giniyatov on 11.11.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
   
    
    // MARK: - Variables
   private let validator = Validation()
   private let dataService = DataService()
   private var users: [User] = []
    var user: User?
    
    // MARK: -  VC Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataService.getUsers(completion: prepareUsers(userData:))
        
    }
    
    func prepareUsers(userData: [User]) {
        
        for user in userData {
            users.append(user)
        }
    }
    
    // MARK: - LogIn button IBAction
   @IBAction func  loginButtonAction(_ sende: Any){
       guard let email = usernameTextField.text else { return }
       guard let password = passwordTextField.text else { return }
       var foundUser: User = User(username: "", email: "", password: "", phoneNumber: "", city: "", avatar: #imageLiteral(resourceName: "profile3"), status: "123")
       var message = "Неправильно введены данные"
       if validator.checkEmail(email) && validator.checkPassword(password) {
           
           for user in users {
               if user.email == usernameTextField.text {
                   foundUser = user
               }
           }
           
           if foundUser.username != "" && foundUser.password == password {
            user = foundUser
               movetoFeed()
           } else {
               message = "Проверьте email или пароль"
               wrondInputAlert(message: message)
           }
           } else {
               message = "Ошибка валидации!"
               wrondInputAlert(message: message)
    }
   }
    
    // MARK: - Alert delivering method
    private func wrondInputAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Попробовать еще раз", style: .default, handler: {_ in alertController.dismiss(animated: true, completion: nil)})
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    private func movetoFeed(){
        sleep(2)
        performSegue(withIdentifier: "feedSegue", sender: nil)
    }
}
