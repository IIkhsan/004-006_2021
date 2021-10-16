import UIKit

class ContentDetailsViewController: FeedDetailsViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func loadData(with feed: Feed?) {
        super.loadData(with: feed)
        contentLabel.text = feed?.content
        contentLabel.sizeToFit()
        view.layoutIfNeeded()
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let headerHeight: CGFloat = 100
        let contentHeight = contentLabel.frame.height
        constraint.constant = max(constraint.constant,
                                  headerHeight+contentHeight)
        
    }
}
