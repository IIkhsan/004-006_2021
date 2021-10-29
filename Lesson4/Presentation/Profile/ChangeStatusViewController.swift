//
//  ChangeStatusViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 17.10.2021.
//

import UIKit

protocol ChangeStatusViewControllerDelegate: AnyObject {
    func changeData(user: User)
}

class ChangeStatusViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var statusTextField: UITextField!
    
    //MARK: - Dependencies
    weak var delegate: ChangeStatusViewControllerDelegate?
    var currentUser: User?
    
    // MARK: -  View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func saveActionButton(_ sender: Any) {
        guard var currentUser = currentUser else { return }
        currentUser.status = statusTextField.text ?? ""
        delegate?.changeData(user: currentUser)
        dismiss(animated: true)
    }
}
