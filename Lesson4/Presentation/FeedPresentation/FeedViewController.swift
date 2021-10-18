//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 30.09.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    /// Dependency
    let service = FeedService()
    
    /// Property
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private functions
    
    /// Сonfiguring a table
    private func configure() {
        service.generateData()
        for a in service.data {
            posts.append(a())
        }
        posts.shuffle()
        guard let feedView = view as? FeedView else { return }
        feedView.feedTableView.delegate = self
        feedView.feedTableView.dataSource = self
        feedView.feedTableView.estimatedRowHeight = 60
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
        cell.setData(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = posts[indexPath.row]
        performSegue(withIdentifier: "postFullInformationSegue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postFullInformationSegue", let viewController = segue.destination as? PostViewController, let post = sender as? Post {
            viewController.post = post
        }
    }
}
