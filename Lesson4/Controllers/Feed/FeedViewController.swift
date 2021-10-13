//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Руслан on 06.10.2021.
//

import UIKit

class FeedViewController: UIViewController, ForUser {
    
    // Outlets
    @IBOutlet weak var postsTableView: UITableView!
    
    // Properties
    var user: User? {
        didSet {
            reloadUserData = true
        }
    }
    private var reloadUserData = false

    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postsTableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: PostTableViewCell.identifier)
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.estimatedRowHeight = 492
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if reloadUserData {
            postsTableView.reloadData()
        }
    }

}

// MARK: - TableView data source methods

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = user?.posts[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(with: post)
        return cell
    }
    
}

// MARK: - TableView delegate methods

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let postViewController = storyboard?.instantiateViewController(withIdentifier: PostViewController.identifier) as? PostViewController else { return }
        postViewController.post = user?.posts[indexPath.row]
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
}
