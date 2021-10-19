//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//
import UIKit

class PostTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postImageViewConstraint: NSLayoutConstraint!
    
    //MARK: - TableView cell's methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - Cell configuration methods
    /// Confgiure  post cell's IBOutlets
    /// - Parameter post: post to be displayed
    func postConfigure(post: Post){
        let cellConfigurationHelper:CellConfigurationHelper = CellConfigurationHelper()
        avatarImageView.image = UIImage(named: post.avatarImage)
        nameLabel.text = post.name
        dateLabel.text = post.date
        postTextLabel.text = post.text
        postImageView.image = cellConfigurationHelper.makePostImage(postImage: post.image)
        
        if post.image == "" {
            postImageViewConstraint.constant = 0
        }
    }
}
