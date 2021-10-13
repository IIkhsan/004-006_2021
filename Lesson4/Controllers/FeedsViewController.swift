//
//  FeedsViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class FeedsViewController: UIViewController, UserIdentifiable {
    // MARK: - properties
    var user: User?
    var feedManager = FeedsManager()
    var feeds: [Feed] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        feedManager.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension FeedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feeds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") ?? UITableViewCell()
        return cell
        
    }
}

// MARK: - FeedsManagerDelegate
extension FeedsViewController: FeedsManagerDelegate {
    func feedManager(_ manager: FeedsManager, didLoadFeeds feeds: [Feed]) {
        self.feeds = feeds
        tableView.reloadData()
    }
    
    func didStartLoadingFeeds(_ manager: FeedsManager) {
        tableView.alpha = 0.1
        activityIndicator.startAnimating()
        
    }
    
    func didFinishLoadingFeeds(_ manager: FeedsManager) {
        activityIndicator.stopAnimating()
        tableView.alpha = 1
    }
    
    
}
