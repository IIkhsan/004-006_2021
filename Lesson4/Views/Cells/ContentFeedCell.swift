import UIKit

class ContentFeedCell: FeedCell {
    override func loadData(with feed: Feed) {
        super.loadData(with: feed)
        contentLabel.text = feed.content
    }
}
