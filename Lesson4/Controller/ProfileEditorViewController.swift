//
//  ProfileEditorViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 21.10.2021.
//

import UIKit

class ProfileEditorViewController: UIViewController {
    
    // MARK: - Outlet Properties
    @IBOutlet weak var statusTextField: UITextView!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - ChangeProfileStatusDelegate
    weak var delegate: ChangeProfileStatusDelegate?
    
    // MARK: - Properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusTextField.text = user.status
    }

    @IBAction func saveChangesAction(_ sender: Any) {
        guard let currentUser = user else { return }
        currentUser.status = statusTextField.text
        delegate?.changeUserData(currentUser: currentUser)
        
        navigationController?.popViewController(animated: true)
    }
}
