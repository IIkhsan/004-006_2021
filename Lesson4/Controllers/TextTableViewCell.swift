
import UIKit

class TextTableViewCell: UITableViewCell {
    var post: Post?
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(post: Post?){
        guard let post = post else { return }
        profileImageView.image = post.profilePicture
        authorLabel.text = post.author
        timestampLabel.text = post.timestamp
        contentLabel.text = post.content
    }

}
