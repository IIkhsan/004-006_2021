//
//  StatusViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 18.10.2021.
//

import UIKit

class StatusViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    @IBOutlet weak var statusTextField: UITextField!
    let userDef = UserDefaults.standard
    
    @IBAction func didSaveStatus(_ sender: Any) {
        userDef.setValue(statusTextField.text, forKey: "status")
        delegate?.update(text: statusTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        statusTextField.text = userDef.string(forKey:"status")
    }
}
