//
//  ProfilePostsTableViewCell.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class ProfilePostsTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var userPostImageViewConstraint: NSLayoutConstraint!
    
    //MARK: - Table View Cell methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - Cell configuration methods
    /// Post cell's IBOutlets configure
    /// - Parameter post: post to be displayed
    func userPostConfigure(post: Post){
        let cellConfigurationHelper: CellConfigurationHelper = CellConfigurationHelper()
        avatarImageView.image = UIImage(named: post.avatarImage)
        usernameLabel.text = post.name
        dateLabel.text = post.date
        postTextLabel.text = post.text
        postImageView.image = cellConfigurationHelper.makePostImage(postImage: post.image)
        
        if post.image == "" {
            userPostImageViewConstraint.constant = 0
        }
    }
}
