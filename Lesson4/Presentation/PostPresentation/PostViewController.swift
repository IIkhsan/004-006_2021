//
//  PostViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 01.10.2021.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var communityImageView: UIImageView!
    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        guard let post = post else { return }
        communityImageView.image = post.communityImage
        communityLabel.text = post.communityTitle
        publicationDateLabel.text = post.publicationDate
        articleLabel.text = post.article
        postImageView.image = post.postImage
    }
}
