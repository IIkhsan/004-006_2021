//
//  TableViewCell.swift
//  Lesson4
//
//  Created by i.ikhsanov on 28.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    //funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func setData(post: Post) {
        imageProfile.image = post.profile_picture
        usernameLabel.text = post.username
        descriptionLabel.text = post.description
        imagePost.image = post.picture
        statusLabel.text = post.status
        
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
    }
}
