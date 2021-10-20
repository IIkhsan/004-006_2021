//
//  EditProfileViewController.swift
//  Lesson4
//
//  Created by Руслан on 09.10.2021.
//

import UIKit

protocol EditProfileViewControllerDelegate: AnyObject {
    
    func updateUserData(with user: User)
}

class EditProfileViewController: UIViewController, UIGestureRecognizerDelegate, CanValidateData {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var lastActivityTextField: UITextField!
    @IBOutlet weak var friendsCountTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var followersCountTextField: UITextField!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    // Properties
    var user: User?
    weak var delegate: EditProfileViewControllerDelegate?
    static let identifier = String(describing: EditProfileViewController.self)
    var imagePicker = UIImagePickerController()
    var pickImageCallback: ((UIImage) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        configureUserData()
    }
    
    // MARK: - Private methods
    
    private func configureUserData() {
        guard let user = user else { return }
        
        navigationItem.title = user.email
        
        avatarImageView.image = user.avatarImage
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        fullNameTextField.text = user.fullName
        statusTextField.text = user.status
        lastActivityTextField.text = user.lastActivity
        friendsCountTextField.text = user.friendsCount
        cityTextField.text = user.city
        educationTextField.text = user.education
        followersCountTextField.text = user.followersCount
        
        imagesCollectionView.reloadData()
    }
    
    private func presentImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didTapAddImageButton(_ sender: UIButton) {
        pickImageCallback = { [weak self] image in
            guard let self = self else { return }
            self.user?.images.append(image)
            self.imagesCollectionView.reloadData()
        }
        presentImagePicker()
    }
    
    @IBAction func didTapSaveBarButton(_ sender: UIBarButtonItem) {
        guard let fullName = fullNameTextField.text else { return }
        if let (title, description) = validate(fullName: fullName, email: nil, password: nil, confirmedPassword: nil) {
            showOkAlert(title: title, description: description)
            return
        }
        
        let updatedUser = User(
            email: user?.email ?? "", password: user?.password ?? "",
            avatarImage: avatarImageView.image, fullName: fullName,
            status: statusTextField.text, lastActivity: lastActivityTextField.text,
            friendsCount: friendsCountTextField.text, city: cityTextField.text,
            education: educationTextField.text, followersCount: followersCountTextField.text,
            images: user?.images ?? [], posts: user?.posts ?? []
        )
        delegate?.updateUserData(with: updatedUser)
        navigationController?.popViewController(animated: true)
    }

}

// MARK: - ImagePicker delegate methods

extension EditProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }
    
}

// MARK: - CollectionView data source methods

extension EditProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath) as? ImagesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.image = user?.images[indexPath.row]
        
        return cell
    }
    
}

// MARK: - CollectionView delegate methods

extension EditProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imagesCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

// MARK: - CollectionView delegate flow methods

extension EditProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
