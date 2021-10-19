//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 18.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataManager = DataManager()
    
    var data: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContent()
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    private func prepareContent() {
            dataManager.getPosts(completion: processingPost(_:))
    }
    
    func processingPost(_ posts: [Post]) {
            posts.forEach { post in
                data.append(post)
            }
        }
}

// MARK: - Table view data source

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"PostCell", for: indexPath) as! PostTableViewCell
        cell.updatePosts(post: data[indexPath.row])
        return cell
    }
}

extension FeedViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailsViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else { return }
        
        detailsViewController.post = data[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}



