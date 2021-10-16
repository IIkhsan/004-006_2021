//
//  FeedsViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class FeedsViewController: UIViewController, UserIdentifiable {
    // MARK: - properties
    weak var user: User?
    var feedManager = FeedsManager()
    var feeds: [Feed] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var feedsTableView: UITableView!
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedManager.delegate = self
        
        // get feeds for user
        getFeeds(for: user)
        
        // register cells with their identifiers
        registerNib(K.feedCell, with: K.feedCell)
        registerNib(K.feedCell_Image, with: K.feedCell_Image)
        registerNib(K.feedCell_Content, with: K.feedCell_Content)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FeedDetailsViewController,
           let sender = sender as? Feed {
            vc.feed = sender
        }
    }
    
    // MARK: - helper methods
    
    // registers the nib design to the tableView
    private func registerNib(_ nibName: String, with identifier: String) {
        feedsTableView
            .register(
                UINib(nibName: nibName, bundle: nil)
                ,forCellReuseIdentifier: identifier)
    }
    
    // get feeds for a user
    private func getFeeds(for user: User?) {
        guard let user = user else {
            // show error alert
            let alertVC = UIAlertController(title: "Authentication Error", message: "You are not logged in. Please login and try again", preferredStyle: .alert)
            
            // create action
            let action1 = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                if let authVC = self?.storyboard?.instantiateViewController(withIdentifier: K.authVC) {
                    DispatchQueue.main.async {
                        self?.navigationController?.setViewControllers([authVC], animated: true)
                    }
                }
            }
            alertVC.addAction(action1)
            present(alertVC, animated: true)
            return
        }
        
        // success case
        feedManager.loadFeedsForUser(userId: user.id)
    }
    
    /// returns a superclass of `UITableViewCell` by dequeuing the tableView
    /// with an already registered identifier
    private func getFeedCell<T: UITableViewCell>(
        withIdentifier identifier: String,
        for indexPath: IndexPath,
        as type: T.Type) -> T? {
            return feedsTableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as? T
        }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension FeedsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feeds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let feed = feeds[indexPath.row]
        switch feed.type {
            case .imageOnly:
                performSegue(withIdentifier: K.gotoImageDetails, sender: feed)
            case .contentOnly:
                performSegue(withIdentifier: K.gotoContentDetails, sender: feed)
            case .both:
                performSegue(withIdentifier: K.gotoDetails, sender: feed)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = feeds[indexPath.row]
        let cell: FeedCellDelegate?
        switch feed.type {
            case .contentOnly: cell = getFeedCell(withIdentifier: K.feedCell_Content, for: indexPath, as: FeedCell_Content.self)
            case .imageOnly: cell = getFeedCell(withIdentifier: K.feedCell_Image, for: indexPath, as: FeedCell_Image.self)
            case .both: cell = getFeedCell(withIdentifier: K.feedCell, for: indexPath, as: FeedCell.self)
        }
        
        if let cell = cell {
            cell.loadData(with: feed)
            return cell
        } else {
            debugPrint("Cell was null / not conformable to FeedCellDelegate protocol")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // get the feed
        let feed = feeds[indexPath.row]

        // return height based on it's type
        switch feed.type {
            case .imageOnly: return 300
            case .contentOnly: return 250
            case .both: return 500
        }
    }
}

// MARK: - FeedsManagerDelegate
extension FeedsViewController: FeedsManagerDelegate {
    func feedManager(_ manager: FeedsManager, didLoadFeeds feeds: [Feed]) {
        self.feeds = feeds
        feedsTableView.reloadData()
    }
    
    func didStartLoadingFeeds(_ manager: FeedsManager) {
        feedsTableView.alpha = 0.1
        activityIndicator.startAnimating()
        
    }
    
    func didFinishLoadingFeeds(_ manager: FeedsManager) {
        activityIndicator.stopAnimating()
        feedsTableView.alpha = 1
    }
    
    
}
