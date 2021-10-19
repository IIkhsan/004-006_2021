//
//  PostsFeedViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 04.10.2021.
//

import UIKit
import Foundation

class PostsFeedViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Var
    private let dataManager = DataManager()
    private var postData: [Post] = []
    
    // MARK: -  View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //Private functions
    private func config() {
        dataManager.getPosts(completion: processingPost(_:))
    }
    
    private func processingPost(_ posts: [Post]) {
        posts.forEach { post in
            postData.append(post)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PostsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsFeedTableViewCell", for: indexPath) as? PostsFeedTableViewCell else { return UITableViewCell()}
        cell.config(post: postData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = postData[indexPath.row]
        performSegue(withIdentifier: "PostViewControllerSegue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PostViewControllerSegue", let viewController = segue.destination as? PostViewController, let post = sender as? Post {
            viewController.post = post
        }
    }
}

