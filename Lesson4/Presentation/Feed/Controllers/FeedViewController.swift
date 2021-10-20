//
//  FeedViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
        
    //MARK: Properties
    var feedModel: FeedModel!
    
    //MARK: - IBOutlets
    @IBOutlet var feedView: FeedView!
    
    //MARK: - Lifecycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        feedModel = FeedModel(delegate: self)
        configureTable()
        feedModel.requireData()
    }
    
    //MARK: - Private functions
    private func configureTable() {
        feedView.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        feedView.tableView.dataSource = self
        feedView.tableView.delegate = self
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postDetailShow" {
            guard let indexPath = sender as? IndexPath else { return }
            guard let detailViewController = segue.destination as? DetailPostViewController else { return }
            detailViewController.configure(post: feedModel.posts[indexPath.row])
        }
    }
}

//MARK: - Table View Delegate
extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(post: feedModel.posts[indexPath.row])
        return cell
    }
}

//MARK: - Table View Datasource
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "postDetailShow", sender: indexPath)
    }
}

//MARK: - Post Table View Cell Delegate
extension FeedViewController: PostTableViewCellDelegate {
    func likeTapped( sender: UITableViewCell) {
        guard let indexPath = feedView.tableView.indexPath(for: sender) else { return }
        feedModel.posts[indexPath.row].likesCount += 1
    }
    
    func likeCanceled(sender: UITableViewCell) {
        guard let indexPath = feedView.tableView.indexPath(for: sender) else { return }
        feedModel.posts[indexPath.row].likesCount -= 1
    }
}

//MARK: -  Feed Model Delegate
extension FeedViewController: FeedModelDelegate {
    func dataUpdated() {
        feedView.tableView.reloadData()
    }
}
