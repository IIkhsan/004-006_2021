//
//  FeedsManager.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation

// MARK: - FeedsManagerDelegate
protocol FeedsManagerDelegate {
    func feedManager(_ manager: FeedsManager, didLoadFeeds feeds: [Feed]);
    func didStartLoadingFeeds(_ manager: FeedsManager)
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
            delegate?.didFinishLoadingFeeds(self)
            delegate?.feedManager(self, didLoadFeeds: feeds)
        }
    }
}
