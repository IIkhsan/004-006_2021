//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Руслан on 06.10.2021.
//

import UIKit

class ProfileViewController: UIViewController, ForUser {
    
    // Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    // Properties
    var user: User? {
        didSet {
            reloadUserData = true
        }
    }
    static let identifier = String(describing: ProfileViewController.self)
    private var reloadUserData = false
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
//        configureUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if reloadUserData {
            configureUserData()
        }
    }
    
    // MARK: - Private methods
    
    private func configureUserData() {
        guard let user = user else { return }
        
        navigationItem.title = user.email
        
        avatarImageView.image = user.avatarImage
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        fullNameLabel.text = user.fullName
        statusLabel.text = user.status
        lastActivityLabel.text = user.lastActivity
        friendsCountLabel.text = user.friendsCount
        cityLabel.text = user.city
        educationLabel.text = user.education
        followersCountLabel.text = user.followersCount
        
        imagesCollectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapEditBarButton(_ sender: UIBarButtonItem) {
        guard let editProfileViewController = storyboard?.instantiateViewController(withIdentifier: EditProfileViewController.identifier) as? EditProfileViewController else { return }
        editProfileViewController.user = user
        editProfileViewController.delegate = self
        navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    
    @IBAction func didTapLogOutBarButton(_ sender: UIBarButtonItem) {
        if let navigationController = navigationController as? UserNavigationController {
            navigationController.logout()
        }
    }
    
}

// MARK: - Custom delegate methods

extension ProfileViewController: EditProfileViewControllerDelegate {

    func updateUserData(with user: User) {
        self.user = user
        configureUserData()
    }

}

// MARK: - CollectionView data source methods

extension ProfileViewController: UICollectionViewDataSource {
    
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

extension ProfileViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imagesCollectionView.deselectItem(at: indexPath, animated: true)
    }

}

// MARK: - CollectionView delegate flow methods

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
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
