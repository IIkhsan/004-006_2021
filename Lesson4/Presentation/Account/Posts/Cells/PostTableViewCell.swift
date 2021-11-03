//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 15.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    //MARK: - Methods
    override func prepareForReuse() {
        postTextLabel.isHidden = false
        postImageView.isHidden = false
    }
    
    //MARK: - Functions
    func setData(post: Post?) {
        if post?.postText == nil {
            postTextLabel.isHidden = true
        } else {
            postTextLabel.text = post?.postText
        }
        
        if post?.postImage == nil {
            postImageView.isHidden = true
        } else {
            postImageView.image = post?.postImage
        }
    }
    
    func setUser(user: User) {
        nameLabel.text = user.name
        avatarImageView.image = user.profileImage
    }
    
    func setUnknownUser() {
        nameLabel.text = "Случайный пользователь"
        avatarImageView.image = UIImage(named: "friend1") ?? UIImage()
    }
}

//MARK: - TableViewCellDelegate
extension PostTableViewCell: TableViewCellDelegate {
    func didDataChange(user: User) {
        setUser(user: user)
    }
}
