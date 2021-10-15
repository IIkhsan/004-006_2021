//
//  ChangeStatusViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 15.10.2021.
//

import UIKit

protocol ChangeStatusViewControllerDelegate: AnyObject {
    func changeData(user: User)
}

class ChangeStatusViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var statusTextField: UITextField!
    
    //MARK: - Var
    weak var delegate: ChangeStatusViewControllerDelegate?
    var currentUser: User?
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Save status action
    @IBAction func saveStatusActionButton(_ sender: Any) {
        guard var currentUser = currentUser else {
            return
        }
        currentUser.status = statusTextField.text ?? ""
        delegate?.changeData(user: currentUser)
        dismiss(animated: true)
    }
}
