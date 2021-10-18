//
//  EditProfileViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 13.10.2021.
//

import UIKit

protocol EditProfileViewControllerDelegate: AnyObject {
    func onDataChange(editProfile: Profile)
}

class EditProfileViewController: UIViewController {
    /// Dependency
    weak var delegate: EditProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let editProfileView = view as? EditProfileView else { return }
        editProfileView.nameTextField.text = profileNow.name
        editProfileView.statusTextView.text = profileNow.status
        editProfileView.cityTextField.text = profileNow.city
        editProfileView.educationTextField.text = profileNow.education
        editProfileView.numberTextField.text = profileNow.number
        editProfileView.workTextField.text = profileNow.work
        editProfileView.maritalStatusTextField.text = profileNow.maritalStatus
        editProfileView.hometownTextField.text = profileNow.hometown
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let editProfileView = view as? EditProfileView else { return }
        profileNow.name = editProfileView.nameTextField.text ?? ""
        profileNow.status = editProfileView.statusTextView.text ?? ""
        profileNow.city = editProfileView.cityTextField.text ?? ""
        profileNow.education = editProfileView.educationTextField.text ?? ""
        profileNow.number = editProfileView.numberTextField.text ?? ""
        profileNow.work = editProfileView.workTextField.text ?? ""
        profileNow.maritalStatus = editProfileView.maritalStatusTextField.text ?? ""
        profileNow.hometown = editProfileView.hometownTextField.text ?? ""
        
        delegate?.onDataChange(editProfile: profileNow)
        self.dismiss(animated: true, completion: nil)
    }
}
