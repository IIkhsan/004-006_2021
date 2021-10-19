//
//  EditViewController.swift
//  Lesson3
//
//  Created by Рустем on 18.10.2021.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    weak var changeNameDelegate: ChangeNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard newNameTextField.text != "" else { return }
        changeNameDelegate?.update(newName: newNameTextField.text ?? data.currentUser.name)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        (tabBarController as? TabBarController)?.exit()
    }
    
    
    
    

}
