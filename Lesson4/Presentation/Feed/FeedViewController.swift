//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    //MARK: - UI
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Var
    var currentUser: User?
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUser()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 150
    }
    
    //MARK: - Get current user and set data
    private func getCurrentUser() {
        if let presentingViewController = presentingViewController as? LoginViewController, let currentUser = presentingViewController.user {
            self.currentUser = currentUser
        }
    }
}

// MARK: - Table view data source and delegate
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUser?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = currentUser?.posts[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.makePost(post: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
