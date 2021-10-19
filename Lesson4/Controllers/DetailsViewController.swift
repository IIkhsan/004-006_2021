//
//  DetailsViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 19.10.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateDetails(post: Post) {
        nameLabel.text = post.author
        timeLabel.text = post.time
        descriptionLabel.text = post.description
        postImage.image = post.image
    }
}
