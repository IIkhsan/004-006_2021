//
//  StatusChangeViewController.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 02.11.2021.
//

import UIKit

protocol StatusChangeVCDelegate {
    func setStatusTo(status: String)
}

class StatusChangeViewController: UIViewController {
    
    // MARK: - Delegate
    var delegate: StatusChangeVCDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var statusChangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - IBActions
    @IBAction func saveStatus(_ sender: Any) {
        let status = statusChangeTextField.text
        delegate?.setStatusTo(status: status!)
    }
    
}
