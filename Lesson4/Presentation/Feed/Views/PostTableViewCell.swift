//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - UI
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    //MARK: - Cell's methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Make post method
    func makePost(post: Post) {
        profileImage.image = post.profileImage
        profileNameLabel.text = post.profileLabel
        contentImage.image = post.contentImage
        infoLabel.text = post.info
    }
    
}
