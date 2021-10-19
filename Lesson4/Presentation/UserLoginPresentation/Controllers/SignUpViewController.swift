//
//  SignUpViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 14.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        let validationManager: ValidationManager = ValidationManager()
        if validationManager.checkEmail(login: loginTextField.text ?? "", controller: self) && validationManager.checkPassword(password: passwordTextField.text ?? "", controller: self) {
            //            UserDatasource.users.append(User(
            //                                            username: usernameTextField.text ?? "",
            //                                            login: loginTextField.text ?? "" ,
            //                                            avatarImage: "image1",
            //                                            password: passwordTextField.text ?? "",
            //                                            status: "",
            //                                            selfPosts: []))
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.backgroundColor = UIColor.systemBlue.cgColor
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
