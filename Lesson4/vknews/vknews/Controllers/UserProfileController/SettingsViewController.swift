//
//  SettingsViewController.swift
//  vknews
//
//  Created by itisioslab on 10.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newBioTextField: UITextField!
    
    // MARK: - properties
    var delegate: StatusEditDelegate?
    var account: Account?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(backAction))
    }
    
    // MARK: - IBAction
    @IBAction func saveIfPressed(_ sender: Any) {
        delegate?.editStatus(text: newBioTextField.text!)
        backAction()
    }
    
    //  MARK: - Object fuction
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
}
