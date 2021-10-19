//
//  NewsFieldTableViewCell.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 29.09.2021.
//

import UIKit

class NewsFieldTableViewCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var newsFieldProfileView: UIView!
    @IBOutlet weak var newsFieldPostStackView: UIStackView!
    @IBOutlet weak var newsFieldProfileLabel: UILabel!
    @IBOutlet weak var newsFieldProfileImageView: UIImageView!
    @IBOutlet weak var newsFieldPostImageView: UIImageView!
    @IBOutlet weak var newsFieldPostLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsFieldProfileImageView.layer.cornerRadius = newsFieldProfileImageView.frame.size.height / 2
    }
    
    // MARK: - Public func configure
    
    func configureNewsFieldTableViewCell(with newsFieldPost: NewsFieldPost) {
        newsFieldPostImageView.image = newsFieldPost.newsFieldPostImage
        newsFieldPostLabel.text = newsFieldPost.newsFieldPostText
        newsFieldProfileLabel.text = newsFieldPost.newsFieldProfileName
        newsFieldProfileImageView.image = newsFieldPost.newsFieldProfileImage
    }
    
    // MARK: - Prepare for reuse func
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsFieldPostImageView.image = nil
        newsFieldPostLabel.text = nil
        newsFieldProfileLabel.text = nil
        newsFieldProfileImageView.image = nil
    }
}
