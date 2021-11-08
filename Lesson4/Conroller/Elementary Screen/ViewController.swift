//
//  ViewController.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    static var arrayOfUsers: [Person] = [Person(email: "test@yandex.ru", password: "qwerty123", name: "Ivanov Ivan Ivanovich"),Person(email: "test2@mail.ru", password: "qaz123", name: "Petrov Petr Petrovich"), Person(email: "test3@yahoo.com", password: "qweasdzxc12", name: "Mirgaliev Timur Aidarovich")]
    static var personHowLogIn: [Person] = []
    let checker = CheckerLogIn()
    let adder = AdderAccaunts()
    
    private var counter: Int = 0
    
    //MARK: - BUTTONS NO ACTION
    @IBOutlet weak var buttonSignInNoAction: UIButton!
    @IBOutlet weak var buttonRegistrationNoAction: UIButton!
    
    //MARK: - TEXT FIELDS
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var vkIconImage: UIImageView!
    
    //MARK: - BUTTONS WITH ACTION
    
    @IBAction func didClickWatchPasswordButton(_ sender: Any) {
        if counter % 2 == 0 {
            passwordTextField.isSecureTextEntry = false
            counter += 1
        } else {
            passwordTextField.isSecureTextEntry = true
            counter += 1
        }
    }
    
    @IBAction func didClickSignInButton(_ sender: Any) {
        if checker.checkUser(login: loginTextField.text, password: passwordTextField.text) {
            let storyboard = UIStoryboard(name: "General", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "1234")
            self.present(vc, animated: true, completion: nil)
        } else {
            createAlert(title: "Проверьте введенные данные", description: "Вы ввели неверные данные")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adder.prepareForWork()
        adder.addAccaunt(personsArray: ViewController.arrayOfUsers)
        buttonSignInNoAction.layer.cornerRadius = buttonSignInNoAction.frame.height / 2.5
        buttonRegistrationNoAction.layer.cornerRadius = buttonRegistrationNoAction.frame.height / 2.5
        passwordTextField.isSecureTextEntry = true
        
    }
}
