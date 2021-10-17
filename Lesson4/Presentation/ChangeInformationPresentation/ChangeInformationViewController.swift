//
//  ChangeInformationViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 13.10.2021.
//

import UIKit

class ChangeInformationViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var townTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var placeOfWorkTextField: UITextField!

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action functions
    @IBAction func saveChangesButtonAction(_ sender: Any) {
        // Properties
        guard let placeOfWork = placeOfWorkTextField.text,
              let nickname = nicknameTextField.text,
              let firstName = firstNameTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let town = townTextField.text,
              let secondName = secondNameTextField.text else { return }
        
        checkFields(nickname: nickname, firstName: firstName, secondName: secondName, phoneNumber: phoneNumber)
        
        for key in db.keys {
            if db[key]?.id == userNow.id {
                db[key]?.nickname = nickname
                db[key]?.firstName = firstName
                db[key]?.number = phoneNumber
                db[key]?.town = town
                db[key]?.secondName = secondName
                db[key]?.placeOfWork = placeOfWork
                
                userNow = db[key] ?? userNow
            }
        }
        
        performSegue(withIdentifier: "ChangeInformationSegue", sender: nil)
    }
    
    // MARK: - Private functions
    private func checkFields(nickname: String, firstName: String, secondName: String, phoneNumber: String) {
        if !isNicknameValide(nickname: nickname) {
            nicknameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "Nickname alert", description: "Nickname length must be at least 4 and contains only english letters")
        } else {
            nicknameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isNameValide(name: firstName) {
            firstNameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "First name alert", description: "First name should contains only english letters")
        } else {
            firstNameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if !isNameValide(name: secondName) {
            secondNameTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
            showAlert(title: "First name alert", description: "Second name should contains only english letters")
        } else {
            secondNameTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
        
        if phoneNumber != "" {
            if !isPhoneNumberValide(phoneNumber: phoneNumber) {
                phoneNumberTextField.backgroundColor = UIColor(red: 100.0/255, green: 0.0/255, blue: 0.0/255, alpha: 50.0/255)
                showAlert(title: "Phone number alert", description: "Phone number should contains only digits and it's length must be 11 characters")
            } else {
                phoneNumberTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
            }
        } else {
            phoneNumberTextField.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0/255)
        }
    }
    
    private func showAlert(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
