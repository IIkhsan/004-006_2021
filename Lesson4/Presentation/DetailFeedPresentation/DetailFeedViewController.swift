//
//  DetailFeedViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 04.10.2021.
//

import UIKit

class DetailFeedViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    // properties
    var post: Post?
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Public functions
    func configure() {
        guard let post = post else { return }
        
        avatarImageView.image = UIImage(named: post.avatar)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.masksToBounds = true
        
        nicknameLabel.text = post.nickname
        postImageView.image = UIImage(named: post.image)
        postLabel.text = post.text
    }

}
