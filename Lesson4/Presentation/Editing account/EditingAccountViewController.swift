//
//  EditingAccountViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import UIKit

class EditingAccountViewController: UIViewController, UserExistenceDelegate {
    //MARK: - UI
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userStatusTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userPhoneTextLabel: UITextField!
    
    //MARK: - Properties
    weak var editingAccountDelegate: EditingAccountDelegate?
    var user: User?
    
    //MARK: - VC's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfile()
    }
    
    //MARK: - Buttons actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveInfo()
        guard let editingAccountDelegate = editingAccountDelegate else { return }
        guard let user = user else { return }
        editingAccountDelegate.editProfile(user)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    private func saveInfo() {
        guard var user = user else { return }
        user.status = userStatusTextField.text ?? ""
        user.city = userCityTextField.text ?? ""
        user.phone = userPhoneTextLabel.text ?? ""
        self.user = user
    }
    
    private func configureProfile() {
        guard let user = user else { return }
        userNameTextLabel.text = user.name
        userAvatarImageView.image = user.avatar
        userStatusTextField.text = user.status
        userCityTextField.text = user.city
        userPhoneTextLabel.text = user.phone
    }
}
