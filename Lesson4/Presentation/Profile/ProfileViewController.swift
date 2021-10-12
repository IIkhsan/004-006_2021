//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 10.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var profileHeaderImageView: UIImageView!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var FollowersCountLabel: UILabel!
    
    @IBOutlet weak var accountImageView: UIImageView!
    // MARK: -  View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBordersGray(element: editProfileButton)
    }
    
    // Private function
    
    private func makeBordersGray(element: UIView) {
            element.layer.borderWidth = 1
            element.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
