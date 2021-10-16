
import UIKit

class MixedDetailsViewController: ContentDetailsViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func loadData(with feed: Feed?) {
        super.loadData(with: feed)
        contentImageView.image = feed?.image
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let contentHeight = contentImageView.frame.height + contentLabel.frame.height + 50
        let headerHeight: CGFloat = 100
        let space: CGFloat = 100
        constraint.constant = max(constraint.constant,
                                  contentHeight + headerHeight + space)
    }
}
