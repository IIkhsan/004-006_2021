//
//  DetailFeedViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 04.10.2021.
//

import UIKit

class DetailFeedViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
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
        
        avatarImage.image = UIImage(named: post.avatar)
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.layer.masksToBounds = true
        
        nicknameLabel.text = post.nickname
        postImage.image = UIImage(named: post.image)
        postLabel.text = post.text
    }

}
