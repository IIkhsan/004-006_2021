import UIKit

class NewsFieldTableViewCell: UITableViewCell {
    
    // IBOutlets
    
    @IBOutlet weak var newsFieldProfileView: UIView!
    @IBOutlet weak var newsFieldPostStackView: UIStackView!
    @IBOutlet weak var newsFieldProfileLabel: UILabel!
    @IBOutlet weak var newsFieldProfileImageView: UIImageView!
    @IBOutlet weak var newsFieldPostImageView: UIImageView!
    @IBOutlet weak var newsFieldPostLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Init Properties func call
        
        initProperties()
    }
    
    // MARK: - Public func configure
    
    func configureNewsFieldTableViewCell(with newsFieldPost: NewsFieldPost) {
        newsFieldPostImageView.image = newsFieldPost.newsFieldPostImage
        newsFieldPostLabel.text = newsFieldPost.newsFieldPostText
        newsFieldProfileLabel.text = newsFieldPost.newsFieldProfileName
        newsFieldProfileImageView.image = newsFieldPost.newsFieldProfileImage
    }
    
    // MARK: - Private funcs
    
    private func initProperties() {
        newsFieldProfileImageView.layer.cornerRadius = newsFieldProfileImageView.frame.size.height / 2
    }
    
    // MARK: - Override func prepareForReuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsFieldPostImageView.image = nil
        newsFieldPostLabel.text = nil
        newsFieldProfileLabel.text = nil
        newsFieldProfileImageView.image = nil
    }
}
