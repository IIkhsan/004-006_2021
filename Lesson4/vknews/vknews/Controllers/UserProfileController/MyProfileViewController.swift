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

    // MARK: -IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBioLabel: UILabel!
    @IBOutlet weak var profieSettingsButton: UIButton!
    
    // MARK: - Properties
    var currentAccount: Account?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - IBAction
    @IBAction func ifSettingsButtonPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "SettingsViewController") as SettingsViewController
        vc.account = currentAccount
        vc.delegate = self
        
        navigationController?.present(vc, animated: true)
    }
    
    // MARK: - Private functions
    private func configure() {
        currentAccount = (tabBarController! as! TabBarViewController).getCurrentUser()
        profileImage.image = currentAccount?.profilePicture
        profileName.text = currentAccount?.username
        profileBioLabel.text = currentAccount?.bio
    }
}

// MARK: Extensions
extension MyProfileViewController: StatusEditDelegate {
    func editStatus(text: String) {
        profileBioLabel.text = text
    }
}


