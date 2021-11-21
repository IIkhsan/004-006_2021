//
//  NewsPostTableViewCell.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 15.11.2021.
//

import UIKit

class NewsPostTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    
    @IBOutlet var newsPostTextLabel: UILabel!
    @IBOutlet var newsPostPhotoImageView: UIImageView!
    @IBOutlet var personPhotoImageView: UIImageView!
    @IBOutlet var personNameLabel: UILabel!
    
    
    //MARK: - Properties
    var newsPost: newsPost?

    // MARK: - ViewController Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(newsPost: newsPost) {
        self.newsPost = newsPost
        newsPostTextLabel.text = newsPost.text
        newsPostTextLabel.numberOfLines = 5
        newsPostTextLabel.frame = CGRect(x: 7, y: 70, width: 370, height: -25)
        newsPostTextLabel.sizeToFit()
        
        newsPostPhotoImageView.image = newsPost.image
        personPhotoImageView.image = UIImage(named: "PersonPhoto1")
        personNameLabel.text = "Arslan Rashidov"
        
        personPhotoImageView.setRounded()
    }
}

extension UIImageView {

    func setRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
