//
//  EditProfileViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 16.10.2021.
//

import UIKit

class EditProfileViewController: UIViewController, UserIdentifiable {
    // MARK: - private props
    weak var user: User?
    var delegate: ProfileViewControllerDelegate?
    
    // view controller that opens the user library
    let imagePickerVC: UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.sourceType = .photoLibrary
        return vc
    }()
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var nameTF: CustomTextField!
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        beautifyViews()
        setupViewItems()
        
        imagePickerVC.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func onEditImagePressed(_ sender: UIButton) {
        present(imagePickerVC,animated: true)
    }
    @IBAction func onSavePressed(_ sender: UIButton) {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let name = nameTF.text ?? ""
        
        // list of error texts
        var errors: [String] = []
        // list of actions to perform on error
        var actions: [() -> Void] = []
        
        if let emailError = Validator.shared.validateEmail(email) {
            errors.append(emailError)
            actions.append { [weak self] in
                self?.emailTF.shake()
            }
        }
        if let passwordError = Validator.shared.validatePassword(password) {
            errors.append(passwordError)
            actions.append { [weak self] in
                self?.passwordTF.shake()
            }
        }
        
        if name.isEmpty || name.count < 3 {
            errors.append("Name is too short")
            actions.append { [weak self] in
                self?.nameTF.shake()
            }
        }
        
        if errors.isEmpty {
            guard let user = user else { return }
            user.email = email
            user.password = password
            user.name = name
            user.image = imageView.image
            delegate?.updateUserDetails(self, withNewUser: user)
        } else {
            Validator.shared.showError(errors.joined(separator: "\n\n"), from: self) {
                for action in actions {
                    action()
                }
            }
        }
    }
    
    // MARK: - helper functions
    private func setupViewItems() {
        emailTF.text = user?.email
        passwordTF.text = user?.password
        nameTF.text = user?.name
        imageView.image = user?.image
    }
    
    private func beautifyViews() {
        let brown = #colorLiteral(red: 0.9882352941, green: 0.8588235294, blue: 0.7176470588, alpha: 1)
        imageView.makeRounded(withColor: brown)
        view.layer.borderColor = brown.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
    }

}

// MARK: - UIImagePickerControllerDelegate
extension EditProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            print("Failed to grab image from image picker")
            return
        }
        // TODO: update imageView
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}
