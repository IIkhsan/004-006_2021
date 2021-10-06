//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 06.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func detailButtonAction(_ sender: Any) {
    }
    
    private func configure() {
        avatarImage.image = UIImage(named: userNow.avatar)
        nicknameLabel.text = userNow.nickname
        fullNameLabel.text = userNow.firstName + " " + userNow.secondName
    }
}
