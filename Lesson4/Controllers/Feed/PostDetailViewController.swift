//
//  PostDetailViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 03.10.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imagePostView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Dependency
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private Functions
    private func configure() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        nameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        avatarImageView.makeRoundAvatar()
        avatarImageView.image = post.avatarImage
        nameLabel.text = post.name
        descriptionLabel.text = post.description
        imagePostView.image = post.imagePost
    }
}
