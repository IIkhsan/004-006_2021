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
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    // MARK: - Standart configure functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public functions
    func setPost(post: Post) {
        avatarImage.image = UIImage(named: post.avatar)
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.layer.masksToBounds = true
        
        nicknameLabel.text = post.nickname
        postImage.image = UIImage(named: post.image)
        postLabel.text = post.text
    }

}
