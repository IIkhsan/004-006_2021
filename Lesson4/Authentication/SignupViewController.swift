//
//  SignupViewController.swift
//  Lesson4
//
//  Created by Руслан on 06.10.2021.
//

import UIKit

class SignupViewController: UIViewController, UIGestureRecognizerDelegate, CanValidateData {
    
    // Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var countOfFriendsTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var followersCountTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    // Properties
    var imagePicker = UIImagePickerController()
    var pickImageCallback: ((UIImage) -> ())?

    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAvatarImageViewTapGestureRecognizer()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapSignUpButton(_ sender: UIButton) {
        guard let fullName = fullNameTextField.text, let username = usernameTextField.text,
              let password = passwordTextField.text, let confirmedPassword = confirmPasswordTextField.text else { return }
        if let (alertTitle, alertDescription) = validate(fullName: fullName, username: username,
                                               password: password, confirmedPassword: confirmedPassword) {
            showOkAlert(title: alertTitle, description: alertDescription)
            return
        }
        guard let loginViewController = navigationController?.viewControllers.first as? LoginViewController else { return }
        
        let newUser = User(
            username: username, password: password,
            avatarImage: avatarImageView.image, fullName: fullName,
            status: statusTextField.text, lastActivity: "Online",
            friendsCount: countOfFriendsTextField.text,
            city: cityTextField.text, education: educationTextField.text,
            followersCount: followersCountTextField.text,
            images: [], posts: []
        )
        loginViewController.addUser(newUser)
        loginViewController.loginUser(newUser)
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: - Private methods
    
    private func configureAvatarImageViewTapGestureRecognizer() {
        avatarImageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAvatarImageView))
        tapGestureRecognizer.delegate = self
        tapGestureRecognizer.numberOfTapsRequired = 1
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func didTapAvatarImageView(_ sender: UITapGestureRecognizer?) {
        pickImageCallback = { [weak self] image in
            guard let strongSelf = self else { return }
            strongSelf.avatarImageView.image = image
            strongSelf.avatarImageView.layer.cornerRadius = strongSelf.avatarImageView.frame.size.height / 2
        }
        presentImagePicker()
    }
    
    private func presentImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }

}

// MARK: - ImagePicker delegate methods

extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }
    
}
