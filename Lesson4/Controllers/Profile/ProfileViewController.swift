//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    var user = User(name: "userName", avatarImage: UIImage(named: "image1")!, hometown: "Kazan", numberOfFriends: "12 friends", lastActivity: "last seen recently")
    
    //MARK: IBOUtlets
    @IBOutlet weak var profileTabBarItem: UITabBarItem!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var numberOffriendsLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        profileTabBarItem?.badgeColor = UIColor.black
        avatarImageView.image = user.avatarImage
        nameLabel.text = user.name
        hometownLabel.text = user.hometown
        numberOffriendsLabel.text = user.numberOfFriends
        lastActivityLabel.text = user.lastActivity
    }
}
