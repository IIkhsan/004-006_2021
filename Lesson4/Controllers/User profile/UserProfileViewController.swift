//
//  UserProfileViewController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 12.11.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - private properties
    var currentUser: User?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = (tabBarController! as! TabBarController).getCurrentUser()
        
        profileImageView.image = currentUser?.image
        nameLabel.text = currentUser?.name
        statusLabel.text = currentUser?.status
    }

}
