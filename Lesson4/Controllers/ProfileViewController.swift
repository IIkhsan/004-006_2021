//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

protocol ProfileViewControllerDelegate {
    func updateUserDetails(_ sender: Any?, withNewUser user: User);
}


class ProfileViewController: UIViewController, UserProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - private properties
    weak var user: User?
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        beautifyViews()
        updateUserInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AppConstants.gotoAuth {
            if let authVC = segue.destination as? AuthViewController {
                authVC.shouldAutoLogin = false
            }
        } else if segue.identifier == AppConstants.gotoProfileEdit {
            if let editProfileVC = segue.destination as? EditProfileViewController {
                editProfileVC.user = sender as? User
                editProfileVC.delegate = self
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func onEditProfilePressed(_ sender: UIButton) {
        performSegue(withIdentifier: AppConstants.gotoProfileEdit, sender: user)
    }
    
    @IBAction func onLogoutPressed(_ sender: UIButton) {
        performSegue(withIdentifier: AppConstants.gotoAuth, sender: nil)
    }
    
    // MARK: - Helper functions
    
    func beautifyViews() {
        let color = #colorLiteral(red: 0.9882352941, green: 0.8588235294, blue: 0.7176470588, alpha: 1)
        profileImageView.makeRounded(withColor: color)
        editProfileBtn.layer.borderWidth = 1
        editProfileBtn.layer.borderColor = #colorLiteral(red: 0.9882352941, green: 0.8588235294, blue: 0.7176470588, alpha: 1).cgColor
    }
    
    func updateUserInfo() {
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        profileImageView.image = user?.image
    }
}
// MARK: - ProfileViewControllerDelegate
// updates the profileView screen when updated by other screens
extension ProfileViewController: ProfileViewControllerDelegate {
    func updateUserDetails(_ sender: Any?, withNewUser user: User) {
        self.user = user
        
        // close the sender
        if let sender = sender as? UIViewController {
            sender.dismiss(animated: true, completion: nil)
        }
        
        // update the data
        updateUserInfo()
        
        AppConstants.delay(bySeconds: 0.6) { [weak self] in
            DispatchQueue.main.async {
                // create the alert
                let alert = UIAlertController(title: "Delegate Called",
                                              message: "Delegate was called and user has been updated",
                                              preferredStyle: .actionSheet)
                let defaultAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
                alert.addAction(defaultAction)
                self?.present(alert, animated: true) // present the alert
            }
        }
    }
}
