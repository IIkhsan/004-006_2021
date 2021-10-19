//
//  ImageTableViewCell.swift
//  Lesson3
//
//  Created by Рустем on 24.09.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    var post: Post?
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(post: Post?) {
        guard let post = post else { return }
        profileImageView.image = post.profilePicture
        authorLabel.text = post.author
        timestampLabel.text = post.timestamp
        pictureImageView.image = post.contentPicture
    }
    
}
