//
//  PostDetailViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 03.10.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imagePostView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    //MARK: - Properties
    var post: Post!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        avatarImageView.image = post.avatarImage
        nameLabel.text = post.name
        descriptionLabel.text = post.description
        imagePostView.image = post.imagePost
    }

}
