
import UIKit
class PostTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var postLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Cell configuring method
    func configurePost(post: Post) {
        if let image = post.postImage{
            postImageView.isHidden = false
            postImageView.image = image
        } else {
            postImageView.isHidden = true
        }
        
        postLabel.text = post.text
        postLabel.sizeToFit()
        userLabel.text = post.username
        userImageView.image = post.userImage
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2        
    }
}
