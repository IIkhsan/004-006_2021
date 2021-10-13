//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Руслан on 09.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var accountLogoImageView: UIImageView!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    // Properties
    static let identifier = String(describing: PostTableViewCell.self)
    
    func configure(with post: Post) {
        accountLogoImageView.image = post.accountLogo
        accountLogoImageView.layer.cornerRadius = accountLogoImageView.frame.size.height / 2
        accountNameLabel.text = post.accountName
        postDate.text = post.date
        
        if post.text != nil {
            postTextLabel.text = post.text
        } else {
            postTextLabel.isHidden = true
        }
        if post.image != nil {
            postImageView.image = post.image
        } else {
            postImageView.isHidden = true
        }
    }

}
