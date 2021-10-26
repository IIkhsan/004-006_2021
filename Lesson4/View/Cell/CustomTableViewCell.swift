//
//  CustomTableViewCell.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    private func configure() {
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 5
        avatarImageView.makeRoundAvatar()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func prepareCell(post: Post) {
        if let image = post.imagePost {
            imagePost.image = image
        } else {
            imagePost.isHidden = true
        }
        if post.description == nil {
            descriptionLabel.isHidden = true
        } else {
            descriptionLabel.text = post.description
        }
        nameLabel.text = post.name
        avatarImageView.image = post.avatarImage
    }
 }
