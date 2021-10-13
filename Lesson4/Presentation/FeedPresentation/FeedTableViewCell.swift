//
//  FeedTableViewCell.swift
//  Lesson4
//
//  Created by Artem Kalugin on 04.10.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    // Outlet properties
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - Standart configure functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public functions
    func setPost(post: Post) {
        avatarImageView.image = UIImage(named: post.avatar)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.masksToBounds = true
        
        nicknameLabel.text = post.nickname
        postImageView.image = UIImage(named: post.image)
        postLabel.text = post.text
    }

}
