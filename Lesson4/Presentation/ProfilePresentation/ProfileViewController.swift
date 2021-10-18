//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 02.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let profileView = view as? ProfileView else { return }
        profileView.profileImageView.image = profileNow.image
        profileView.nameLabel.text = profileNow.name
        profileView.statusLabel.text = profileNow.status
        profileView.cityLabel.text = profileNow.city
        profileView.educationLabel.text = profileNow.education
        profileView.numberLabel.text = profileNow.number
        profileView.workLabel.text = profileNow.work
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueEditProfile", let viewController = segue.destination as? EditProfileViewController {
            viewController.delegate = self
        }
    }
    
    // MARK: - Buttons
    @IBAction func editInformation(_ sender: Any) {
        performSegue(withIdentifier: "segueEditProfile", sender: nil)
    }
    
    @IBAction func detailedInformation(_ sender: Any) {
        performSegue(withIdentifier: "segueFullInformationProfile", sender: nil)
    }
}

// MARK: - EditProfileViewControllerDelegate
extension ProfileViewController: EditProfileViewControllerDelegate {
    func onDataChange(editProfile: Profile) {
        for i in 0..<profiles.capacity-1 {
            if profiles[i].id == profileNow.id {
                profiles[i] = profileNow
            }
        }
        configure()
    }
}
