//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 01.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fillPosts()
    }
    
    private func fillPosts() {
        for _ in 0...10 {
            posts.append(createPost())
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.setPost(post: posts[indexPath.row])
    
        return cell as UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailFeedViewController") as! DetailFeedViewController
        vc.post = posts[indexPath.row]
        navigationController?.present(vc, animated: true, completion: nil)
    }
}

