//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 18.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    func updatePosts(post: Post) {
        userNameLabel.text = post.author
        descriptionLabel.text = post.description
        postImage.image = post.image
        timeLabel.text = post.time
    }
}
