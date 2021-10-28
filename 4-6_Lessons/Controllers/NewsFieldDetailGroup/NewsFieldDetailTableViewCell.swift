import UIKit

class NewsFieldDetailTableViewCell: UITableViewCell {
    
    // IBOutlets
    
    @IBOutlet weak var newsFieldDetailProfileImageView: UIImageView!
    @IBOutlet weak var newsFieldDetailProfileLabel: UILabel!
    @IBOutlet weak var newsFieldDetailPostImageView: UIImageView!
    @IBOutlet weak var newsFieldDetailPostLabel: UILabel!
    
    // MARK: - Public funcs
    
    func configureNewsFieldTableViewCell(with newsFieldPost: NewsFieldPost) {
        newsFieldDetailPostImageView.image = newsFieldPost.newsFieldPostImage
        newsFieldDetailPostLabel.text = newsFieldPost.newsFieldPostText
        newsFieldDetailProfileImageView.image = newsFieldPost.newsFieldProfileImage
        newsFieldDetailProfileLabel.text = newsFieldPost.newsFieldProfileName
        newsFieldDetailProfileImageView.layer.cornerRadius = newsFieldDetailProfileImageView.frame.height / 2
    }
}
