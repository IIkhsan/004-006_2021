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
        self.backgroundColor = #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 5
        avatarImageView.makeRoundAvatar()
        nameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
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
