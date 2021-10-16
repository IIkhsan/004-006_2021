//
//  FeedsManager.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

// MARK: - FeedsManagerDelegate
protocol FeedsManagerDelegate {
    /// function called when feeds have been loaded with `feeds` an array of [Feed] items
    func feedManager(_ manager: FeedsManager, didLoadFeeds feeds: [Feed]);
    
    /// function called when loading for feeds have started
    func didStartLoadingFeeds(_ manager: FeedsManager)
    
    /// function called when loader should stop
    func didFinishLoadingFeeds(_ manager: FeedsManager)
}

// MARK: - FeedsManager structure
struct FeedsManager {
    var delegate: FeedsManagerDelegate?
    let feedsService = FeedsService()
    
    func loadFeedsForUser(userId: String) {
        delegate?.didStartLoadingFeeds(self)
        
        // get the feeds and update the delegates after fetch
        feedsService.getFeeds(for: userId) { feeds in
            DispatchQueue.main.async {
                delegate?.didFinishLoadingFeeds(self)
                delegate?.feedManager(self, didLoadFeeds: feeds)
            }
        }
    }
}
