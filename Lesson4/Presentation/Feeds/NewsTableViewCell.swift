//
//  NewsTableViewCell.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    //MARK: - UI
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNameTextLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTextStack: UIStackView!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    //MARK: - Var
    var post: Post?
    
    //MARK: - Cell's methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure
    func configure(_ post: Post) {
        self.post = post
        authorAvatarImageView.image = post.author.avatar
        authorNameTextLabel.text = post.author.name
        
        if post.text == nil {
            mainTextStack.isHidden = true
        } else {
            descriptionTextLabel.text = post.text
        }
        
        if post.image == nil {
            mainImageView.isHidden = true
        } else {
            mainImageView.image = post.image
        }
    }
}
