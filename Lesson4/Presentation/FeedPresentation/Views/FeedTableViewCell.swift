//
//  FeedTableViewCell.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    /// Outlets
    @IBOutlet weak var communityImageView: UIImageView!
    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Setting data for a sell
    /// - Parameter post: Post with data
    func setData(post: Post) {
        communityImageView.image = post.communityImage
        communityLabel.text = post.communityTitle
        publicationDateLabel.text = post.publicationDate
        articleLabel.text = post.article
        postImageView.image = post.postImage
    }
}
