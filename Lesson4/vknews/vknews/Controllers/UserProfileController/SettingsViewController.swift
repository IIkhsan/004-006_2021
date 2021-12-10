//
//  SettingsViewController.swift
//  vknews
//
//  Created by itisioslab on 10.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var changeBioLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - properties
    var statusEditDelegate: StatusEditDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func saveIfPressed(_ sender: Any) {
        statusEditDelegate?.editStatus(text: changeBioLabel.text!)
    }
    
}
