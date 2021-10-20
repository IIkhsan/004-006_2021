
import UIKit

class FeedDetailsViewController: UIViewController {
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var parentView: UIView!
    
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorProfileImageView.layer.cornerRadius = authorProfileImageView.frame.height / 2
        authorProfileImageView.clipsToBounds = true
        loadData(with: feed)
        updateConstraint(viewHeightConstraint)
        parentView.layoutIfNeeded()
    }
    
    func loadData(with feed: Feed?) {
        authorProfileImageView.image = feed?.author.image
        authorNameLabel.text = feed?.author.name
        if let username = feed?.author.username {
            authorUsernameLabel.text = "@\(username)"
        }
    }
    
    // TODO: (3) dynamic height for views
    func updateConstraint(_ constraint: NSLayoutConstraint) {
        // should be at most the view height at first
       constraint.constant = min(constraint.constant, view.frame.height)
    }
}
