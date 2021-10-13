//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class ProfileViewController: UIViewController, UserIdentifiable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - private properties
    var user: User?
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        beautifyViews()
        updateUserInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.gotoAuth {
            if let authVC = segue.destination as? AuthViewController {
                authVC.autoLogin = false
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func onEditProfilePressed(_ sender: UIButton) {
    }
    
    @IBAction func onLogoutPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.gotoAuth, sender: nil)
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
