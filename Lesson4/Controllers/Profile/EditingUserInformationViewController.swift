//
//  EditingUserInformationViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 14.10.2021.
//

import UIKit

class EditingUserInformationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    
    var dataTransferDelegate: DataTransferProtocol?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var modifiedNameTextField: UITextField!
    @IBOutlet weak var modifiedHometownTextField: UITextField!
    @IBOutlet weak var modifiedStatusTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modifiedStatusTextField.delegate = self
        modifiedHometownTextField.delegate = self
    }
    
    //MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let status = modifiedStatusTextField.text,
              let hometown = modifiedHometownTextField.text,
              let name = modifiedNameTextField.text,
              !status.isEmpty, !hometown.isEmpty, !name.isEmpty
        else { return false }
        
        dataTransferDelegate?.didPressReturn(newStatus: status, newHometown: hometown, newName: name)
        navigationController?.popToRootViewController(animated: true)
        
        return true
    }
}

