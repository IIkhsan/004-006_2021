//
//  PostViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 01.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    /// Сonfiguring post with full information
    private func configure() {
        guard let postView = view as? PostView else { return }
        guard let post = post else { return }
        postView.communityImageView.image = post.communityImage
        postView.communityLabel.text = post.communityTitle
        postView.publicationDateLabel.text = post.publicationDate
        postView.articleLabel.text = post.article
        postView.postImageView.image = post.postImage
    }
}
