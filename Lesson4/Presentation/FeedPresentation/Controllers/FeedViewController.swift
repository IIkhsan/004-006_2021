//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var feedTableView: UITableView!
    //MARK: - Vars
    var posts: [Post] = [Post]()
    //MARK: - UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.estimatedRowHeight = 60
        
        let dataManager: DataManager = DataManager()
        dataManager.getPersonalPosts { posts in
            self.posts = posts
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue",
           let viewController = segue.destination as? PostViewController,
           let post = sender as? Post {
            viewController.post = post
        }
    }
}
//MARK: - UITableViewDataSource, UITableViewDelegate extension
extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.postConfigure(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        performSegue(withIdentifier: "detailsSegue", sender: posts[indexPath.row])
    }
    
    
}
