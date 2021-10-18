//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    //    MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //    MARK: - Init
    
    public func configure(post: Post) {
        
        if let image = post.image {
            customImageView.isHidden = false
            customImageView.image = image
        }else{
            customImageView.isHidden = true
        }
        
        if let description = post.text {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        }else{
            descriptionLabel.isHidden = true
        }
        
        usernameLabel.text = post.authorUsername
        userImageView.image = post.authorImage
    }
}
