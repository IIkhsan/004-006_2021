//
//  MyProfleViewController.swift
//  vknews
//
//  Created by itisioslab on 11.10.2021.
//

import UIKit

protocol StatusEditDelegate {
    func editStatus(text: String)
}

class MyProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBioLabel: UILabel!
    @IBOutlet weak var profieSettingsButton: UIButton!
    
    // MARK: - private properties
    var currentAccount: Account?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAccount = (tabBarController! as! TabBarViewController).getCurrentUser()
        
        profileImage.image = currentAccount?.profilePicture
        profileName.text = currentAccount?.username
        profileBioLabel.text = currentAccount?.bio
    }

     // MARK: - IBAction
    @IBAction func ifSettingsButtonPressed(_ sender: Any) {
        guard let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
        settingsViewController.statusEditDelegate = self
        navigationController?.present(settingsViewController, animated: true)
    }
}
    

    // MARK: Extensions
extension MyProfileViewController: StatusEditDelegate {
    func editStatus(text: String) {
        profileBioLabel.text = text
    }
}


