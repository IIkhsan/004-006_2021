//
//  PostsFeedTableViewCell.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 08.10.2021.
//

import UIKit

class PostsFeedTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //Funcions
    
    func config(post: Post){
        accountImageView.image = post.user.accountImage
        usernameLabel.text = post.user.username
        accountNameLabel.text = post.user.accountName
        postTextLabel.text = post.postText
        dateLabel.text = post.postDate
        postImageView.image = post.postImage
        makeImageViewRound(image: accountImageView)
    }
    
    //Private funcion
    
    private func makeImageViewRound(image: UIImageView) {
            image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
}
