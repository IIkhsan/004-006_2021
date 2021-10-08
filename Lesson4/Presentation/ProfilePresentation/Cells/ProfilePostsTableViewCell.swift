//
//  ProfilePostsTableViewCell.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class ProfilePostsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(avatarImage: String, name: String, date: String, postImage: String, postText: String){
        if postImage == "" {
            self.postImageView.image = nil
        } else {
            self.postImageView.image = UIImage(named: postImage)
        }
        self.avatarImageView.image = UIImage(named: avatarImage)
        usernameLabel.text = name
        dateLabel.text = date
        postTextLabel.text = postText
    }
}
