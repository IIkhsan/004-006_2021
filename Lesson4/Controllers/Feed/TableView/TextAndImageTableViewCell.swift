//
//  TextAndImageTableViewCell.swift
//  Lesson3
//
//  Created by Рустем on 24.09.2021.
//

import UIKit

class TextAndImageTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var post: Post?
    
    // MARK: - UI Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Init
    
    func configure(post: Post?) {
        guard let post = post else { return }
        profileImageView.image = post.profilePicture
        authorLabel.text = post.author
        contentLabel.text = post.content
        timestampLabel.text = post.timestamp
        pictureImageView.image = post.contentPicture
        
        if contentLabel.text == nil {
            contentLabel.isHidden = true
        } else {
            contentLabel.isHidden = false
        }
        
        if pictureImageView.image == nil {
            pictureImageView.isHidden = true
        } else {
            pictureImageView.isHidden = false
        }
    }
    
    // MARK: - Action

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
