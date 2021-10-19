//
//  NewsFieldDetailTableViewCell.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 11.10.2021.
//

import UIKit

class NewsFieldDetailTableViewCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var newsFieldDetailProfileImageView: UIImageView!
    @IBOutlet weak var newsFieldDetailProfileLabel: UILabel!
    @IBOutlet weak var newsFieldDetailPostImageView: UIImageView!
    @IBOutlet weak var newsFieldDetailPostLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Public funcs
    
    func configureNewsFieldTableViewCell(with newsFieldPost: NewsFieldPost) {
        newsFieldDetailPostImageView.image = newsFieldPost.newsFieldPostImage
        newsFieldDetailPostLabel.text = newsFieldPost.newsFieldPostText
        newsFieldDetailProfileImageView.image = newsFieldPost.newsFieldProfileImage
        newsFieldDetailProfileLabel.text = newsFieldPost.newsFieldProfileName
        newsFieldDetailProfileImageView.layer.cornerRadius = newsFieldDetailProfileImageView.frame.height / 2
    }
}
