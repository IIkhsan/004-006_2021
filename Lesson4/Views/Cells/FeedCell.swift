import UIKit

protocol FeedCellDelegate: UITableViewCell {
    func loadData(with feed: Feed)
}

class FeedCell: UITableViewCell, FeedCellDelegate {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.masksToBounds = true
    }
    
    func loadData(with feed: Feed) {
        authorNameLabel.text = feed.author.name
        authorUsernameLabel.text =
        feed.author.username.starts(with: "@")
        ? feed.author.username
        : "@\(feed.author.username)"
        
        profileImageView.image = feed.author.image
        if feed.type == .both {
            feedImage.image = feed.image
            contentLabel.text = feed.content
        }
    }
}
