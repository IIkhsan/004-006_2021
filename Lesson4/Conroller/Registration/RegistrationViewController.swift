//
//  RegistrationViewController.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 01.10.2021.
//

import UIKit

let validator = SaverOfProfile()
var arrayOfUsers: [Person] = []
var flag: Bool = true

class RegistrationViewController: UIViewController {
   
    private var counterFirst: Int = 0
    private var counterSecond: Int = 0
   
    //MARK: TEXT FIELDS
    @IBOutlet private weak var numberTextField: UITextField!
    @IBOutlet weak var firstPasswordTextField: UITextField!
    @IBOutlet weak var secondPasswordTextFiled: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var buttonSaveProfileNoAction: UIButton!
    
    //MARK: BUTTONS WITH ACTION
    @IBAction func didClickSaveProfile(_ sender: Any){
        if let data = UserDefaults.standard.object(forKey: "personsArray") as? Data {
            arrayOfUsers = try! PropertyListDecoder().decode(Array<Person>.self, from: data)
        }
        if validator.checkAllParametrs(email: numberTextField.text, firstPassword: firstPasswordTextField.text, secondPassword: secondPasswordTextFiled.text, arrayOfUsers: arrayOfUsers) {
            createAlert(title: "Ваш аккаунт успешно создан", description: nil)
            arrayOfUsers.append(Person.init(number: numberTextField.text ?? "", password: firstPasswordTextField.text ?? "", name: nameTextField.text ?? ""))
            UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayOfUsers), forKey: "personsArray")
        } else {
            createAlert(title: "Ошибка в email или пароле", description: "Возможно данный email уже занят")
        }
       
    }
    
    @IBAction func didClickWatchPasswordFirstButton(_ sender: Any) {
        if counterFirst % 2 == 0 {
            firstPasswordTextField.isSecureTextEntry = false
            counterFirst += 1
        } else {
            firstPasswordTextField.isSecureTextEntry = true
            counterFirst += 1
        }
    }
    @IBAction func didClickWatchPasswordSecondButton(_ sender: Any) {
        if counterSecond % 2 == 0 {
            secondPasswordTextFiled.isSecureTextEntry = false
            counterSecond += 1
        } else {
            secondPasswordTextFiled.isSecureTextEntry = true
            counterSecond += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSaveProfileNoAction.layer.cornerRadius = buttonSaveProfileNoAction.frame.height / 2
    }
    
}
