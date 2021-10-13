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
}
