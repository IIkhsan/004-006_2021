
import UIKit

class ImageFeedCell: FeedCell {
    override func loadData(with feed: Feed) {
        super.loadData(with: feed)
        feedImage?.image = feed.image
    }
}
