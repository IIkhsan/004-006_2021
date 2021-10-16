
import UIKit

class ImageDetailsViewController: FeedDetailsViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func loadData(with feed: Feed?) {
        super.loadData(with: feed)
        contentImageView.image = feed?.image
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let headerHeight: CGFloat = 100
        let imageHeight = contentImageView.frame.height
        let space: CGFloat = 100
        constraint.constant = max(constraint.constant, headerHeight + imageHeight + space)
    }
}
